---
date: "2012-06-26T00:00:00Z"
title: My journey to the International Olympiad in Informatics
updated_at: June 2020
notice: "**June 2020:** If you landed here because you want to prepare and qualify for IOI, that's fantastic! My story below might be useful to you, but for training I recommend [this book](https://cpbook.net/) and reading [this post](https://codeforces.com/blog/entry/69100). [This](https://cp-algorithms.com/) is another brilliant resource for algorithms and datastructures. Good luck!"
---

Back in January [Hailey Somerville][hailey] told me about her participation in the [Australian Informatics Competition][orac], a competition for Australian high school students in informatics. Having done mostly Web development so far, I became quite interested and searched for something similar in Denmark. To my surprise I found a Danish equivalent: [“Dansk Datalogi Dyst”][ddd] (DDD, Danish Informatics Competition). The ultimate goal of the national competitions, Danish as well as Australian, is to be elected as one of four to compete in the [International Olympiad in Informatics][ioi] (IOI), one of many international high school science olympiads. In Denmark the election process for the IOI-team consists of three phases: An online qualification round; where all Danish high schools can participate, The Nationals; competition for the 10 best from the qualification round, and the [Baltic Olympiad][boi]; where the six best from the Nationals compete against each other and participants from the other Nordic and Baltic countries. Finally the four best from the Baltic Olympiad are chosen to compete in IOI.

This is the story of how I ended up qualifying for the toughest high school programming contest in the world (IOI).

## Solving an NP-hard problem, without knowing of NP-hard problems

Initially I thought the Nationals would conflict with my study trip to Barcelona in mid-March, but when the final dates regarding Barcelona were set, the possibility of making it only 8 hours late to the Nationals appeared. This sudden change of plans meant I had to tackle the qualification round with almost no training. I also discovered all solutions had to be written in C, C++ or Pascal, none of which I knew.

In mid-February the tasks for the online qualification round were released, and we were given about a week (alongside school) to solve the problems. [The first task][dice] I solved rather quickly ([how I solved it][dicesolution]). I wrote a solution in Ruby, and translated it to the approved language C, with the help of Google and Hailey. Drugged by the eureka-effect I went on to look at [the second problem][parking] which appeared much harder. The feeling of being able to solve any problem soon wore off. After hours and hours of thinking, I came up with what should reach a perfect solution to the problem. This problem, unlike the other, had feedback upon submission. Enabled feedback means you are able to see how many points your program scored out of the maximum of 100, when you upload it to the submission site. 

The score in IOI-style competitions is based on speed, correctness and memory usage of your program. Furthermore it shows which errors occurred (wrong answer/timeout) during execution on different, unknown test cases. A test case is a pair of input, data given to your program, and output, data expected to be given back by your program for the input. With 500 lines of horrible C code, I was proud to have implemented my “perfect solution”.

When I uploaded it, I received just 25 points. I was very disappointed, to put it mildly. All the other test cases resulted in timeouts. At that point, it was only a few hours left till deadline. By desperately micro-optimizing with [memoization][memoization], optimizing memory usage and lots of other minor things, I was able to get just above 30 points. 

I later found out what I had been trying to solve was an [NP-hard problem][np] (basically it means that the perfect solution can only be achieved in exponential time, growing by the length of input), without even knowing what an NP-problem was. My program did find optimal solutions, but ran in exponential time, thus it did not receive maximum score because it timed out. You were supposed to find suboptimal solutions, however, not knowing about NP-problems I was certain I could find the optimum solutions (the better the solution, the more points, for this particular task)!

I was pretty disappointed with myself that I had not been able to score the 100 maximum points in the second task, but even then I already felt like I had learned a lot. I comforted myself with the fact that I had actually scored points with so little training, but did not expect to make it to the Nationals.

## Nationals with a hangover

In the end of February I received an email that I had been selected to participate in the Nationals in Informatics! Excited for the coming week, I went to Barcelona in mid-March with my class. We had a great trip, and on the flight back I was working on solving a preparation task given to us by the team leaders on the plane, I regretably arrived 8 hours late at the boarding school where the Nationals were held.

The purpose of the national competition is a weekend of intense training rounded off with a 5-hour IOI-style competition. Based on the general impression, results of the qualification tasks and tasks solved during the weekend as well as the results of the competition, 6 of the 10 in the Nationals were chosen to compete in the Baltic Olympiad. 

With no phone numbers of any team leaders or participants, I had no idea where to go as I was looking despairingly at a school building with no lights in any of the windows. I got the idea that they could’ve set up a WiFi for the competition. I walked around campus with my phone in front of me as was it a flashlight, searching for a WiFi, a clue. And finally! A WiFi called “DDD” (Danish acronym for Danish Informatics Competition) appeared in my list of networks. Guided by the increasing WiFi strength I was able to find the right building, in which I could follow the sound of smashing keyboards to find the competition room. As I entered, I was met by 9 guys completely claimed by their laptop screens. I was immediately given all the tasks the other participants were working on or had already completed, and were told they had had lessons in [“Recursion”][recursion] and [“Divide and Conquer”][daq], I was familiar with recursion, but not Divide and Conquer. Googling my way to understand Divide and Conquer, I was able to solve a few of the tasks. However, I was extremely tired, because I had slept roughly 5 hours per night during the Barcelona trip. Around 2 hours after my arrival at 10pm I was almost falling asleep writing my recursive routines, so I decided to close my eyes till we were all advancing to the sleeping quarters..
 
After breakfast on saturday, I felt much more energized. The routine was that every 4 hours we’d be introduced to a new “programming concept”, and receive ~2-6 tasks where this, combined with previously introduced concepts, had to be applied. All the solutions had to be submitted to the same site I submitted my qualification solutions to, as it was all part of the final evaluation. The tasks were incredibly challenging, like nothing I had ever tried before. Sometimes in extreme desperation combined with tiredness from the trip, I’d think about taking the next train home. This feeling would disappear with the utter joy and confidence that arose whenever I would finally solve a task, and creep back once again when I found myself still struggling after an hour on a new problem. But this kept me going. By saturday afternoon, I had almost managed to get up to speed with the others, and were doing the same tasks as them.

On sunday morning we were introduced to the last concept, [dynamic programming][dynamic], after doing a few dynamic programming problems, the 5-hour National competition started. These tasks were even more difficult. I was able to solve the first one to about 60 points (out of the maximum 100). On paper I came up with a solution to the second problem, but I did not manage to successfully implement it within the timeframe. With a total of 60 points, I assessed my own chance of proceeding to the next stage, the Baltic Olympiads, rather slim. Even then, I was satisfied with my own performance during the weekend: Managing to catch up while being 8 hours behind, and achieving 60 points in the Nationals having only solved in the region of 4-5 tasks in total before the training camp! It is by far the weekend in my life in which I have learnt the most. I would find out if I was one of the six to go to Latvia for the Baltic Olympiad at the science olympiad reception a month later, but I did not bet on it.

## Science olympiad reception with a cheerful surprise

[Carlsberg, Denmark][carlsberg] is the main sponsor of the Science Olympiads in Denmark. In Denmark we have teams for: Geography, physics, mathematics, informatics, biology and chemistry. In the end of April, all the participants in the Nationals had come to the reception in Denmark’s capital, Copenhagen to hear the announcements of the final teams. Our minister of “children and education” held a speech, so did the leader of the physics team, and the director of the foundation that Carlsberg has for supporting science. One of the consistent themes of the speeches (except for our minister) was that it is a pity with so little focus on what they called the “elite students” in the Danish education system. They praised the system for being very good at handling the weak students, but criticized it for not being equally good at challenging the top students. There was no press at the event.

The director of the Carlsberg science foundation announced the names of those who were on the national teams: mathematics, physics, biology, .. and then, finally, informatics. As I heard my name, I was flabbergasted. I took the train back home, happy that my informatics adventures were not over yet for this year.

## Studying Knuth

Because I did not expect to qualify for the Baltic Olympiad, I had not trained up to the reception. With only about a week to the Baltics, I armed myself with a borrowed copy of [“The Art of Computer Programming”][taocp], working through the exercises, read up on common algorithms on Wikipedia, completed tasks on [USACO][usaco], and memorized the critical parts of my Vim config for the competition computers. I managed to create quite an intense training weekend for myself, although regretting not having had more optimism for proceeding to the Baltics by preparing prior to the reception, I felt much more ready on the other side of the weekend. [Firmafon][firmafon], where I work, was kind enough to give me my own copy of Knuth’s compilation.

![](/static/images/knuth.JPG)

## The Baltic Olympiad in Informatics and Europe’s widest waterfall

With the other 5 participants, of which 4 had participated before, and two team leaders who were previous participants, we flew to Riga, Latvia and drove to Ventspils with the Finnish team. IOI-style international competitions like BOI consists of two competition days, each of 5 hours with 3 tasks.

About one hour into the competition on the first day, my excitement had soon been replaced by the all familiar balance between frustration and encouragement when finally figuring something out. The tasks were even more difficult than those at the Nationals, so I decided to focus all my energy into [a single task][mobile] ([my approach to solving it][mobilesolution]), where I managed to come up with a solution which I calculated would yield around 30 points (too slow for larger input). After the competition I talked with the other Danish participants who had participated before, who said the tasks were indeed more difficult than usual. Few had gotten anything working at all.

The citizens of Ventspils seemed very proud of their city, so in lieu of the much needed nap we were all craving after 5 hours of brain-tumbling in the competition room, we went on one of many excursions to see Ventspils, a small tourist city with a population of around 40 000. At the end of the excursion we arrived at an adventure park, where we received the day’s competition results in a letter. Surprisingly, 4/6 of the Danish team had achieved 0/300 points on the first day. Including me. I couldn’t quite figure out what went wrong with my program, talking with the other teammates it seemed like a small off-by-one mistake. Aww. Many of the other teams had similar results. A tired, disappointed Danish team went back to the hotel to get some sleep before the next competition day.

The difficulty on the second day was much like the first. Thus I decided to once again devote all the time to [a single task][fire], exploring edge-cases with pen and paper, rethinking even the most trivial logic. Once again, I was quite sure I had figured out a 30-point solution. But when we received our results, it turned out I had only received 10 points on the second day.

According to the other, more experienced Danish participants the tasks had been unusually difficult, and normally you get more points for a slow, working solution (like mine on the second day), about 30-40 points. The 10 points from the second day became my final score, I was [positioned as the fifth dane](boiresults), so I was rather certain to not get on the IOI-team of 4. I was disappointed now that I had come so far, but taken the experience of the other participants into consideration, I could be quite happy with my result, and follow my plan to go all-in next year. I chose to focus on the wrong tasks on both days, wrong because they were not the easiest, even if they looked like that at a first glance. But these are the kinds of things you learn from experience. Once again, I had learned a lot, and I had a great time with the team in Latvia.

They loved taking us out for excursions, preferably several per day, to see old Soviet radars, light towers, trains and Europe’s widest waterfall, which we drove a total of 3 hours to see....

![](/static/images/ioi/waterfall.jpg)

Europe’s widest waterfall (impressive height: ~0.5 meter) in Kuldiga, Latvia

[All tasks for BOI 2012.][boitasks]

## Competition lessons

From BOI and the Nationals I learned that you must avoid digging holes. Repeatedly I found myself so fixated on getting a particular idea to work I’d get absolutely nowhere. Sometimes you have to bite the bullet, delete your program, find a new sheet of paper, and start from scratch. A good smell of this is when you start working around your general solution to the problem to solve specific edge-cases. I learned that there is almost always a simple way to solve the problem without explicitly handling edge-cases. If there are two edge-cases, there’s almost certainly two more. The simple solution will handle edge-cases automatically, even those you might have not considered.

In the IOI-style competitions where you can achieve partial scores (i.e. the results are not binary: completed/not completed, as in most University competitions), thus it’s wise to create naive, slow solutions scoring 30-40 points for a task (except at Baltics in 2012, where doing so proved to be difficult). Being able to quickly spot the tasks where this is possible, can let you achieve easy points. Enough easy points can even grant you a medal. Afterwards, you can go back in the remaining time to improve on your solution.

It’s paramount to perform all thinking on paper. I wrote all my algorithms in plain English, which worked well to find holes and explore edge cases. I applied the algorithm on paper on test cases I made up myself. When writing it out in English I sometimes found myself writing “then just..”, this is a smell. Often these “just”-lines required fundamental change in my solution. Do not defer thinking till you get to do the actual implementation. Expanding a “just” takes 5 minutes, and these are always saved, usually multiple times. During the implementation you are inclined to not think of a proper solution to the subproblem, and you will just hack your way around it. You then must return to paper immediately. Pen and paper are life savers. The thinking done when implementing should be minimal.

## Now

In the beginning of June I received an email saying I was chosen as one of the four to compete for Denmark in IOI 2012, Italy in September! I try to do a few problems a week as preparation, and I participate in online competitions like [Codeforces][codeforces] and [Topcoder][topcoder]. I contacted the local university ([Aarhus University][au]) for a mentor in algorithms, and got a phD student to point me in the right directions.

I have learned much by visiting “the other side”, and I am looking forward to learn more. My problem-solving skills have increased tremendously. Coming from doing only Web development where the difficulties lie in structuring your application, it has been amazing to try and solve hard problems using algorithms and hours of thinking. It’s so incredibly satisfying to solve a problem you’ve worked several hours on.

I can continue to bring many of the things I learn from the competitions into my day-to-day work. I see more and more opportunities, interesting ways to process data and I am starting to understand how some of the magical services actually work underneath. It opens many possibilities for me as a developer. Combining different algorithms and data structures, I can make applications I never dreamt of creating. It has a brought a unique and fundamental missing tool to my toolbox. My ultimate goal is to win a medal in IOI 2013 in Brisbane, Australia, which is the last year in which I can compete, because I finish high school next year. Now I am looking forward to Italy in September, and I’ll be sure to do a writeup when I am on the other side of that.

[hailey]: https://twitter.com/haileysaccount
[orac]: http://orac.amt.edu.au/ "Australian Informatics Competition"
[ddd]: http://ddd.emu.dk/ "Dansk Datalogi Dyst's website"
[ioi]: http://en.wikipedia.org/wiki/International_Olympiad_in_Informatics "Wikipedia Page on IOI"
[boi]: http://www.boi2012.lv/ "BOI 2012 website"
[dice]: https://www.evernote.com/shard/s30/sh/a249c078-2cff-440d-af2e-af0de21d8d71/5f5c9150efffa0dc627c8b9bbff0ba54  "My own translation of the problem from Danish"
[parking]: http://ioinformatics.org/locations/ioi00/contest/day1/car/car.pdf "Problem description"
[memoization]: http://en.wikipedia.org/wiki/Memoization
[np]: http://en.wikipedia.org/wiki/NP-hard
[teleport]: http://www.mimuw.edu.pl/~kubica/publications/2001-boi/boi2001.ps
[recursion]: http://www.mimuw.edu.pl/~kubica/publications/2001-boi/boi2001.ps
[daq]: http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm
[dynamic]: http://en.wikipedia.org/wiki/Dynamic_programming
[carlsberg]: http://en.wikipedia.org/wiki/Carlsberg_Group "Wikipedia page on Carlsberg"
[usaco]: http://ace.delos.com/usacogate "USACO, I recommend this for getting started"
[taocp]: http://en.wikipedia.org/wiki/The_Art_of_Computer_Programming "Wikipedia page on Knuth's bible"
[firmafon]: http://firmafon.dk
[mobile]: http://www.boi2012.lv/data/day1/eng/mobile.pdf
[fire]: http://www.boi2012.lv/data/day2/eng/fire.pdf
[boitasks]: http://www.boi2012.lv/tasks
[codeforces]: http://www.codeforces.com/
[topcoder]: http://www.topcoder.com/
[au]: http://www.au.dk/
[dicesolution]: /dice
[mobilesolution]: /mobile
[boiresults]: http://www.boi2012.lv/results "Results for BOI 2012 in Latvia"
