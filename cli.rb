require 'thor'
require 'uri'
require 'json'
require 'time'
require 'date'
require 'net/http'
require 'pp'
require 'pathname'
require 'byebug'

# CLI for managing blog
class Sirupsen < Thor
  desc 'images', 'Localize images'
  def images
    i = 0
    Dir['content/**/*.md'].each do |path|
      body = File.read(path)
      paths = body.scan(/\!\[.*\]\((.+)\)/).flatten
      external_images = paths.select { |path|
        path.start_with?("https://") && path =~ /\.(jpg|jpeg|png|gif)$/i
      }

      external_images.each do |image_path|
        image_name = Pathname.new(image_path).basename.to_s
        new_path = "./static/static/images/#{image_name}"

        unless File.exist?(new_path)
          puts "Downloading #{image_path}.."
          system("curl #{image_path} -o #{new_path}")
        end

        url_path = "/static/images/#{image_name}"
        body.sub!(image_path, url_path)
      end

      File.open(path, 'w') { |f| f.write(body) }
    end
  end

  desc "buttondown", "Download buttondown emails"
  def buttondown(name = nil)
    json = `curl -s -H "Authorization: Token #{ENV['BUTTONDOWN_TOKEN']}" https:///api.buttondown.email/v1/emails`
    result = JSON.parse(json)
    emails = result['results']
    emails.each do |email|
      filename = "./content/napkin/#{email["slug"].gsub("napkin-", "")}.md"
      next if File.exist?(filename)
      puts 'yes'
      File.open(filename, 'w') do |f|
        f.write("---\n")
        f.write("date: #{email["publish_date"]}\n")
        f.write("title: #{email["subject"].inspect}\n")
        f.write("---\n\n")
        f.write(email["body"])
      end
    end
  end

  desc "goodreads", "Goodreads review download"
  def goodreads(uri = nil)
    require 'nokogiri'
    raise "needs to be a review url" unless uri["review/show"]
    html = `curl -s --tlsv1.2 -k -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36" --fail --http1.1 #{uri.to_s}`
    raise "failed to curl: #{html}" unless $?.success?
    doc = Nokogiri::HTML(html)

    review = {
      book_title: doc.at_css("a.bookTitle").text,
      rating: doc.at_css(".rating .value-title").attributes["title"].value.to_i,
      review: doc.at_css(".reviewText.description").children.to_html.strip,
      authors: doc.css(".authorName").children.children.map { |e| e.text }.join(", "),
      link: "https://goodreads.com#{doc.at_css(".bookTitle").attributes["href"].value}",
      finished_reading: Time.parse(doc.css(".readingTimeline__text").map { |e| e.text.match(/(\w+, \d{4})\n–\n\nFinished Reading/) }.compact.first[1])
    }

      book_title_short = review[:book_title].split(":")[0]
        .downcase.gsub(/ /, "-")
        .gsub(/[^\w\-]/, "")

      icon = case review[:rating]
             when 5
               "🥇"
             when 4
               "🥈"
             when 3
               "🥉"
             when 2
               "🤷"
             when 1
               "😞"
             else
               "❓"
             end

      rating = review[:rating] > 0 ? review[:rating] : "-1"

      body = review[:review]
      body.gsub!(/&gt\;(.+?)\<br><br>/, "<blockquote>\\1</blockquote>")
      body.gsub!("<br><br>","</p>\n\n<p>")
      body.gsub!(/__(.+?)__/,"<i>\\1</i>")

      # byebug if review.book.title =~ /grit/i

      filename = "./content/books/#{book_title_short}.html"
      File.open(filename, 'w+') do |f|
        f.write("---\n")
        f.write("date: \"#{review[:finished_reading].to_date}\"\n")
        f.write("title: \"#{review[:book_title]}\"\n")
        f.write("book_author: \"#{review[:authors]}\"\n")
        f.write("book_rating: \"#{rating}\"\n")
        f.write("book_rating_icon: \"#{icon}\"\n")
        f.write("book_goodreads_link: \"#{review[:link]}\"\n")
        f.write("---\n\n<p>")
        f.write(body.strip)
        f.write("</p>")
      end
  end
end

Sirupsen.start(ARGV)
