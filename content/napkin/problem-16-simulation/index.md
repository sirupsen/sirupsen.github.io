---
date: "2021-09-13T00:00:00Z"
title: "Napkin Problem 15: Sometimes, You Simulate"
---

A few years ago, we were revisiting old systems as part of moving to an
architecture to serve traffic out of _both_ our data-centres. One was a daemon
spun up for every shard to do some book-keeping. We were discussing how we'd
make sure we'd have at least ~2-3 daemons per shard (for high availability). The
'obvious' solution was to have some sort of "cross-shard coordination" that each
daemon would consult when it would boot to figure out which shard to serve. We
had systems capable of this, and it sounds 'simple', but in my experience you'll
inevitably spend a while ironing out all the bugs when you have this amount of
processes and distributed coordination.

As a quick, curious thought-experiment I asked: 

> "What if we avoid the coordination by having the daemon choose a shard to
> serve at random when booting. We boot enough that by all likelihood each shard
> has at least 2?"

To rephrase the problem in a mathy way, with `n` being the number of shards:

> "How many times do you have to roll an n-sided die to ensure you've seen each
> side at least `m` times?"

This nerd-sniped everyone in the office pod. It didn't take long before some
were pulling out complicated Wikipedia entries on probability theory, trawling
their email for their old student MatLab licenses, and formulas appeared on
whiteboard I had no idea how to parse.

Insecure that I've only ever done high school math, I surreptitiously started
writing a simple [simulator][sim]. After 10 minutes I was done, and they were still
arguing about this and that probability formula. Once I showed them the
simulation the response was: _"oh yeah, you could do that too... in fact that's
probably simpler...."_ We all had a laugh and referenced that hour endearingly
for years after. (If you know a closed-form mathematical solution, I'd be very
curious! Email me.)

```bash
$ ruby die.rb
Max: 2513
Min: 509
P50: 940
P99: 1533
P999: 1842
P9999: 2147
```

It followed from running the simulation that we'd need to boot 2000+ processes
to ensure we'd have _at least_ 2 book-keepers per shard with a 99.99%
probability with this strategy. Compare this with the ~400 we'd need if we did
some light coordination. As you can imagine, we then did the napkin cost of ~1600
excess dedicated CPUs to run these book-keepers at [~$10/month][costs]. Was this
worth ~$16,000 a month? Probably not.

Throughout my career I remember countless times complicated Wikipedia entries
have been pulled out as a possible solution to some problems.  I can't remember
a single time that was actually implemented over something simpler. It might be
a sign it's time to write a simulator, if nothing else, to prove that something
simpler might work.

## Don't Trust Your Intuition, Simulate!

Anything involving probability can be deceivingly difficult. The Monty Hall
problem illustrates this well:

> Suppose you're on a game show, and you're given the choice of three doors:
> Behind one door is a car; behind the others, goats. You pick a door, say No. 1,
> and the host, who knows what's behind the doors, opens another door, say No. 3,
> which has a goat. He then says to you, "Do you want to pick door No. 2?" Is it
> to your advantage to switch your choice?
> -- [Wikipedia Entry for the Monty Hall problem][monty]

![](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Monty_open_door.svg/2560px-Monty_open_door.svg.png)

Against your intuition, the best choice _is_ to switch your choice. This
completely stumped me. Reading the explanation on the [Wikipedia entry][monty]
several times, I still didn't get it. Watching [videos][montyvid], I think
that..  maybe... I get it? Erdős, one of the most renowned mathematicians in
history also wasn't convinced until he was shown a simulation. After writing [my
simulation][montysim] however, I finally feel like I get it. I won't try to offer
an explanation here, click the video link above, or try to implement a
simulation -- and you'll see! The short of it is that the host always opens
the non-winning door, and not your door, which reveals information about the
doors, improving your odds from 1/3 to 2/3 if you always switch.

```
$ ruby monty_hall.rb
Switch strategy wins: 666226 (66.62%)
No Switch strategy wins: 333774 (33.38%)
```

My rule for when to simulate is:

> Simulate _anything_ that involves more than one probability or probabilities
> over time.

In other words, you don't need to simulate that the probability of rolling a six
on a dice once is `1/6`, or maybe even that rolling two sixes is `1/6^2 = 1/36`.
But unless you just took a probability course, if it gets more complicated than
that, do yourself a favour and just simulate it!

When I used to do [informatics competitions][info] in high school, I also wasn't
that confident in the more math-heavy tasks -- so I would often write
simulations for various things to make sure some equation held in a bunch of
scenarios (often using binary search).

## Another Real Example: Load Shedding

At Shopify, a good chunk of my time there I worked on teams that protected the
platform. Years ago, we started working on a 'load shedder.' The idea was that
when the platform was overloaded we'd prioritize traffic. For example, if a shop
got inundated with traffic (typically bots), how could we make sure we'd
prioritize shutting off the bots? Failing that, only degrade that single store?
Failing that, only impact that shard?

Hormoz Kheradmand lead most of this effort, and has written [this post][hormoz]
about it in more detail. When Hormoz started working on the first load shedder,
we were uncertain about what algorithms might work for shedding traffic fairly.
It was a big topic of discussion in the lively office pod, just like the
die-problem I opened with. Hormoz started [writing simulations][simulate] to
develop a much better grasp on how various controls might behave. This worked
out wonderfully, and also served to convince the team that a very simple
algorithm for prioritizing traffic could work which Hormoz describes in [his
post][hormoz].

Of course, prior to the simulations, we all started talking about various
Wikipedia entries of complicated, cool stuff we could do. The simple simulations
showed that none of that was necessary -- perfect! The value of exploratory
simulation for nebulous tasks where it's hard to justify the complexity is
tough. It gives a feedback loop, and typically a justification to keep V1
simple.

Do you need to bin-pack tenants on `n` shards that are being filled up randomly?
Sounds like _probabilities over time_, a lot of randomness, and smells of
NP-completion. It won't be long before someone points out deep learning is
perfect, or some resemblance to protein folding or whatever... Write a simple
simulation with a few different sizes and see if you can beat random by even a
little bit. Probably random is fine.

You need to plan for retirement and want to stress-test your portfolio? The
state of the art for this is using [Monte Carlo analysis][mc] which, for the
sake of this post, we can say is a fancy way to say "simulate lots of
random scenarios."

I hope you see the value in simulations for getting a handle on these types of
problems. You'll also find that writing simulators is some of the most fun
programming there is. Enjoy! 

[sim]: https://gist.github.com/sirupsen/8cc99a0d4290c9aa3e6c009fdce1ffec
[costs]: https://github.com/sirupsen/napkin-math#cost-numbers
[monty]: https://en.wikipedia.org/wiki/Monty_Hall_problem
[montyvid]: https://www.youtube.com/watch?v=4Lb-6rxZxx0
[montysim]: https://gist.github.com/sirupsen/87ae5e79064354b0e4f81c8e1315f89b
[info]: https://sirupsen.com/my-journey-to-the-international-olympiad-in-informatics/
[hormoz]: https://hormozk.com/capacity/
[simulate]: https://github.com/hkdsun/simiload
[mc]: https://engaging-data.com/will-money-last-retire-early/
