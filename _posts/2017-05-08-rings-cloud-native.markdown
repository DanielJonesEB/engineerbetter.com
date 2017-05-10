---
layout: post
title:  The Concentric Rings of the Cloud Native Enterprise
author: dan
comments: true
---
<img src="/images/blog/eb-concentric-rings.jpeg" class="image fit">

At EngineerBetter we generally categorise cloud-native transformation challenges into four problem spaces:

- Self-service Platforms
- Continuous Delivery
- Application Architecture
- Organisational Change

Through our experiences with enterprises, we began to arrange these problem spaces into a mental model formed of concentric rings. We've found it useful to structure our thinking like this when we talk to customers, because it helps highlight how platform adoption tends to reveal new problems and constraints, in an ever wider context.

<!--more-->

In addition to sensemaking this model actually helps us do the work, by encouraging initial focus on achieving small wins within the immediate context of the platform team. We can then use this as a vantage point to observe and respond, working outward to address the more distant or pervasive issues once we understand more about the situation.

It's important to remember that each enterprise is a complex adaptive system; in reality nobody finds such neat boundaries in their contexts, especially at the outer ring. Rather than implying we should silo our thinking, the purpose of the model is to shine a light on common patterns and anti-patterns so we can surface and anticipate issues and cross-cutting concerns.

In the absence of this kind of awareness enterprise silos will tend to optimise locally, addressing a single area in isolation. Often a particular team or business unit will engage with us to solve a particular problem and quickly find that the outcomes they imagined are actually limited by other areas outside their direct control. The lesson here is that achieving meaningful and sustaining change requires an understanding of the entire system that is flowing value to customers.

## Self-service Platforms

We deliver services in the platform space, so for us this is the most common observation point and the reason it forms the centre of our model. We founded EngineerBetter with the intention of using this point as a beach head from which to drive change in enterprises. A self-service developer platform like Cloud Foundry can affect dramatic change by [reducing the technical problem space](/2017/05/05/anthropic-sympathy.html). It also immediately begins to reveal what we refer to as the 'rakes on lawn'; these are the bureaucratic, regulatory or cultural obstacles that hit you in the face as you pursue the business outcome you want from using the platform. For example, if your desired outcome is lower lead time to deployment, you must optimise the entire delivery value stream. Simply standing up your platform is just one part of this.

## Continuous Delivery

A self-service platform won't achieve business outcomes unless it provides a path to production. For this reason, continuous delivery pipelines become the next logical problem to tackle. A fundamental objective of continuous delivery is to make it [economic to work in small-batch sizes](https://www.amazon.co.uk/d/Books/Continuous-Delivery-Deployment-Automation-Addison-Wesley/0321601912). Once you can work in small batches, with good test coverage, you are in a position to start re-factoring, because you have [an isolation of cause and effect](https://twitter.com/AgileSteveSmith/status/734811899389485058). You need to create this feedback loop, so you can learn as you iterate on your apps.

## Application Architecture

Being in a position where we can make small changes safely and cheaply, we can address the question of how to architect our applications appropriately for a cloud environment. This requires Enterprise developers and architects to immerse themselves in the topics of [12 Factor](https://12factor.net/) applications and [microservices](https://martinfowler.com/articles/microservices.html). Beyond learning a new set of good practices for building software, the working process we use at EngineerBetter changes the actual process of making architectural decisions. The right decision emerges through the process of developing the software, instead of being decided in advance - put simply, [architect becomes a verb, not a noun](https://www.infoq.com/articles/enterprise-architecture-cloud).

Cloud-native architecture is also closely linked with the concept of product teams, as opposed to project teams. With an understanding of [Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law), we design a team structure that mimics the software architecture we want. Arranging people into cross-functional, value-oriented teams also makes it easier to collocate, with greatly reduced transaction costs, since people can communicate in small batches. The team can act autonomously, to focus on an outcome instead of a specific activity in the value stream. This topic blends nicely into our outermost ring.

## Organisational Change

The inner three rings of our model are usually as far as most grass roots transformation efforts reach before hitting the buffers. By this point the enterprise immune system, faced with completely incompatible working process, based on an alternative world view, has kicked in.

Even in cases where senior executive sponsorship is in place, a large amount of friction is usually observed in the middle management tier of the enterprise. These poor folks - unhelpfully called the "frozen middle" - find themselves caught between a program of change and the expectations that others still have of them. They have agile practices being forced on them from one direction while simultaneously being held captive by the mesh of *commitment* which still exists, from the implicit command and control structure. It's no surprise that they appear to be resistant.

The "frozen middle" phenomenon shows us that there is big difference between the conventional notion of senior executive 'buy-in' and the process of actually changing the way management has been conditioned to think. Sponsorship or buy-in implies something extrinsic and transactional, but meaningful and long-lasting change depends on executive leadership being willing to change themselves, rather than simply asking others to change. Through this they can alleviate the commitment that cascades downwards from the boardroom. The executive team need to switch the lens through which they view their own business, changing habits and beliefs about how to allocate money, make decisions and communicate intentions.

The following table shows just how profound this reconfiguration of executive leadership needs to be. When finding themselves in complex situations, characterised by extreme uncertainty, business leaders need to find a common language with those at the edge of the organisation. They need to stop asking the questions on the left and start asking the questions on the right.

<img src="/images/blog/enterprise-agility-boardroom.png" class="image fit">

Being able to answer the question "What business outcome do want?" and being able to express this intent without dictating specific deliverables is not something that comes naturally to us if we've worked in traditional enterprise management. We've never been asked to do it before. Likewise for the idea of [framing our decisions as experiments](https://barryoreilly.com/2013/10/21/how-to-implement-hypothesis-driven-development/), allowing us to reduce uncertainty by placing small bets to buy information, so we can make our next decision.

No matter how unfamiliar this mindset seems, it can be learnt. New habits can be formed. Leaders can learn to take a hypothesis-driven approach instead of forcing certainty onto uncertain situations. Furthermore, we can all learn to create safer, happier working environments where it is [ok to be wrong](https://lizkeogh.com/2017/03/05/yes-and/).

At EngineerBetter we believe that our approach of enablement through delivery and *continuous improvement* is an appropriate way for anyone in an organisation to build better habits, not just development teams. Our purpose is making software development more humane, more effective and less wasteful; pursuit of this goal depends on us working with everyone, across all 4 of our identified problem spaces. Get in touch if you'd like to find out more.
