---
title: About
---

I grew up in Aarhus, Denmark. The second-largest city in the country after
Copenhagen. Sometimes we say that it's "the world's smallest biggest city",
which I tend to agree with. In high school I used to compete for Denmark in
[algorithmic problems][ioi]. I wasn't that good at it (Denmark has a small
population, not as hard to be selected as in, e.g. the US), but I learned a lot.
At the same time, I worked at [Firmafon][firmafon]. They build a fantastic phone
and chat support tool for the Danish market. In 2013, I moved to Ottawa, Canada
to work as a software developer at Shopify. They found me through a [clickbaity
article][iphone] I wrote about not having a smartphone. It started as a 'gap
year.' I am now many gap years in.

When joining Shopify, I was interested in the infrastructure team. That's the
team that gets paged if the site isn't working.  The goal of the infrastructure
team is to make software as reliable and fast as possible. I worked as an
infrastructure engineer for several years: the initial system that [sends data
to our 'data warehouse'][kafka] (Kafka, 2013), [moving Shopify to
containers][dockercon] to make it faster and more predictable to move code from
developer's machines to the data-center (Docker, 2014), and improving
[resiliency of the platform][resiliency] ([Toxiproxy][toxiproxy],
[Semian][semian], 2014-2015).

In 2016 I became the lead of a small team (3-5) and was tasked to make [Shopify
able to run out of multiple data-centers at once][pods], which we completed by
Black Friday and Cyber Monday in 2016. In 2017, I grew the team into two teams,
one responsible for [moving shops without downtime between regions][shopmv] and
another responsible for the 'job infrastructure', running [workloads outside of
web requests made to Shopify][jobs] to do large-scale data migrations. In 2018,
I started building the Service Communication team that's building the software
to make it as easy as possible for applications built inside Shopify to talk to
each other.

Today, I run a lab called New Capabilities which boots up highly technical
teams, straddling a role somewhere between project manager, manager, and
engineer. I take help get projects off the ground, while building the team and
enabling everyone on it to grow. My goal is to put the team in a position where
they no longer need me as fast as possible.

In 2019 in New Capabilities we started a team to do a complete [rewrite of the
Shopify Storefront][sfr], which serves all merchant store traffic. It's
architected based on everything we have learned from running Shopify at scale.
It's able to serve read-traffic out of multiple regions, [cache
better][sfrcache], and is much more performant.

In 2020, we've worked on patches to MySQL and real-time components for the Admin
of Shopify. For half of 2020 and 2021 I worked on expanding the search efforts at Shopify. In May 2021 I left Shopify.

I spend time [reading][reading], [cooking][cooking], weightlifting, working on
[personal software projects][airtable], and paddling.

If you need to [pronounce my name][name] in English.

[kafka]: http://www.shopify.com/technology/14909841-kafka-producer-pipeline-for-ruby-on-rails
[ioi]: /my-journey-to-the-international-olympiad-in-informatics/
[dockercon]: https://www.youtube.com/watch?v=Qr0sATj9IVc
[resiliency]: https://atscaleconference.com/videos/resiliency-testing-with-toxiproxy/
[toxiproxy]: https://github.com/shopify/toxiproxy
[pods]: https://www.youtube.com/watch?v=N8NWDHgWA28
[jobs]: https://www.youtube.com/watch?v=XvnWjsmAl60
[reading]: /read/
[cooking]: /season-driven-cooking/
[airtable]: /airtable/
[iphone]: /iphone/
[firmafon]: https://www.firmafon.dk/english
[semian]: http://github.com/shopify/semian
[name]: /name.mp3
[sfr]: https://shopify.engineering/how-shopify-reduced-storefront-response-times-rewrite
[sfrcache]: https://shopify.engineering/simplify-batch-cache-optimized-server-side-storefront-rendering
[shopmv]: https://www.usenix.org/conference/srecon16europe/program/presentation/weingarten
