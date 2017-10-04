---
layout: post
title: Post-DevOps
categories: update
author: deejay
comments: true
---
<img src="/images/blog/hyattregencypool.jpg" class="fit image">

Post-DevOps describes a level of maturity whereby traditional further agility is achieved by providing a self-service, automatable platform which enables application product teams to perform all operational activities. Traditional DevOps is practiced by both application product teams and the platform product team, above and below the 'platform line' respectively.

## Benefits over traditional DevOps

* All the things that are good about DevOps, without the undifferentiated heavy lifting
* De-duplicated efforts - the platform is instantly reusable, as opposed to reinventing/sharing handcrafted deployment techniques
* Easier hiring and training, as each group need know fewer technologies
* Separation of concerns - each group has a smaller problem space to master, and fewer places to look when debugging

## What is Post-DevOps?

Post-DevOps is application product teams being responsible for the development and operations of their apps, deployed on a self-service platform that is in turn developed and operated by the platform product team.

## How does Post-DevOps work?

A self-service, automatable platform is provided by the Platform Product Team. This platform has key features:

* Complete lifecycle management of applications (deployment, restarts, teardown)
* Lifecycle management of services (creating, binding, tearing down databases)
* Ability to view logging, metrics and debug data for applications

The platform API forms the contract between application product teams and the platform product team, and allows separation of the concerns of each.

'Above' the platform API application product teams practice DevOps in the traditional sense. They have complete ownership of their code throughout its lifecycle, including 'Day 2' operations and support. Their operational activities are enabled by the platform, abstracting away underlying technologies and allowing them to focus on their core competencies.

'Below' the platform API the Platform Product Team actively _develops_ the platform as a software product, soliciting new features from users, test-driving the platform as code, performing continuous integration of changes and continuously delivering change to the production platform.

## How did we get here?

DevOps as a movement gained traction because it led to *more reliable software* that was *delivered more quickly*, and requires a way of working that is *more humane* and more satisfying.

DevOps as a term has been diluted beyond most meaning. Are you a system admin? Have you used Puppet? Congratulations, you now get a pay-rise and can call yourself _a_ DevOps! What is the collective noun for a group of folks that orchestrate Chef via Jenkins? That's right, it's _The DevOps Team_!

In all seriousness, we use the existence of "_the_ DevOps team" as a quick indicator of the level of maturity of businesses we work with. It's a sure sign that people need help focusing on true collaboration.

For the sake of this discussion we'll take DevOps to mean "the practice of being responsible for both the development and ongoing operation of applications."

In traditional DevOps application developers (either individually or as a team) gained responsibility for the operation of their apps: deployment, lifecycle management, issue diagnosis, and yes, out-of-hours support. This total ownership has a key business benefit: more reliable software due to having 'skin in the game' of operations. Additionally adopting DevOps becomes a forcing function for the immediacy of self-service, increasing the speed of delivery, the turnaround from live issue to resolution, and subsequently increasing the motivation and job satisfaction of engineers.

The first time I realised that there was something wrong with the notion of DevOps was whilst watching the fearsomely smart [Bethan Williams](https://www.linkedin.com/in/bethan-williams-09b57b4/) giving a talk that suggested that a company should either adopt DevOps _or_ a Platform-as-a-Service, but not both at the same time.

Upon hearing that idea, I was a little dismayed. "Really?" I thought. "DevOps is clearly awesome. Are we really suggesting that we should just give people a platform, and go back to people chucking work over a fence?" It gave me pause for thought though.

If DevOps was no more effective than app developers caring only about writing code, would it have gained popularity? Quite simply, no. Our IT practices are driven by market forces, and what is most effective (eventually) wins. So DevOps is not intrinsically better, even if its humane qualities make it feel that way. It gives better results.

I think it's fair to say that in our ecosystem we've struggled with this dichotomy for a while. We know DevOps is good; we know platforms are good. It took the ever-insightful Colin Humphreys to nail the issue (many years _after_ starting a PaaS consultancy, may I add) with what I fondly refer to as "The Chumphreys Post-DevOps Quadrants:"

