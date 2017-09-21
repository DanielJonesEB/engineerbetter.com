---
layout: post
title:  Bringing Perpetual Motion to Software Updates - Self-Upgrading Concourse CI
author: pete
comments: true
---

<img src="/images/blog/perpetual-motion.jpg" class="image fit" />

We've got some great feedback from early Concourse-up users, but they wanted more. So recently we've been working on adding functionality to Concourse-up. Here's what we've been up to:

## Self-update

<img src="/images/blog/self-update.png" class="image fit" />

Concourse-up took deploying Concourse on AWS from a complex series of steps to a single console command. Well now we've reduced that to _zero_ commands. When Concourse-up deploys Concourse, it now adds a pipeline to the new Concourse called `concourse-up-self-update`. This pipeline continuously monitors our Github repo for new releases and updates Concourse in place whenever a new version of Concourse-up comes out.

It hurts my head to think about how this actually works for more than five minutes at a time but I'll do my best to explain it here.

Internally, Concourse-up runs the following tasks idempotently when deploying:

1. Build AWS infrastructure using Terraform
1. Deploy a bosh director and Concourse deployment
1. Set the self-update pipeline

Let's say we release an update that updates some code on the Concourse worker VM. This will result in BOSH taking down the worker node during step 2 in order to update the code running on it. Which would result in downtime for the Concourse. Now if this update was triggered by a self-update job running on the Concourse _itself_, we're going to run into trouble as BOSH will try and update the VM that is running the job that triggered BOSH to update the VM in the first place (this is where my head starts to hurt).

When you run a task in BOSH like a deployment, typically BOSH streams the output back to you. But BOSH also lets you background the task and it will keep going by itself until it finishes. This is what the Concourse-up self-update pipeline does to ensure that the CI job that triggers the update finishes so that BOSH can drain the worker and update the VM.

But if you look at our 3 tasks above, you can see that if we exit early during task 2, we'll never get to do task 3 — set the self-update pipeline. This means if we wanted to update our self-update pipeline (meta, I know) we wouldn't be able to. Therefore in self-update mode, Concourse-up changes the order and runs the tasks this way:

1. Build AWS infrastructure using Terraform
1. Set the self-update pipeline
1. Deploy a bosh director and Concourse deployment (and exit early to let BOSH do it's thing)

This ensures that any new self-update pipelines get set, and that the CI job can safely exit know BOSH is upgrading Concourse in the background.

Finally, since we deploy our own [ci.engineerbetter.com](https://ci.engineerbetter.com) using concourse-up, we are not only continuously releasing new versions of `concourse-up` whenever there is a new component or stemcell on [bosh.io](https://bosh.io), but that same CI server is then continuously upgrading itself using the releases that it builds.

## Metrics

<img src="/images/blog/ci-metrics.png" class="image fit" />

Concourse-up now automatically deploys Influxdb, Riemann, and Grafana on the web node. You can access Grafana on port 3000 of your regular concourse URL using the same username and password as your Concourse admin user. We put in a default dashboard that tracks

* Build times
* CPU usage
* Containers
* Disk usage

## Cheaper

We realised we were being too generous with your money. By reducing instance sizes of the bosh director, Concourse web node, and RDS and by removing the unnecessary load balancer, we've saved you about $90/mo in AWS costs. Feel free to buy us a beer next time you see us.

## All Regions

We were using m3 instance types for some jobs — these aren't supported in all AWS regions. We've updated Concourse-up to only use instances available in all AWS regions.

## NAT Gateway

Many enterprise users need to give Concourse access to their internal services. This usually involves white-listing IP addresses but can be tricky when the workers use ephemeral IPs. We've added a NAT gateway so that there is a single persistent IP for outbound traffic. It also adds an extra layer of security by preventing the workers from being directly addressed.

## DB Encryption by default

Concourse has the option to encrypt its database, but it isn't enabled by default. Concourse-up now enables encryption of the Concourse DB. Run `concourse-up info --json <YOUR DEPLOYMENT NAME>` if you need to recover your DB encryption key.

And that's the latest news on Concourse-up! If you have any feedback or suggestions please feel free to get in touch with us or create a [github issue](github.com/EngineerBetter/concourse-up).
