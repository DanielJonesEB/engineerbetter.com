---
layout: post
title:  Up and running with BOSH and Concourse - Part 1.
author: dan
permalink: /bosh-concourse.html
---
<img src="/images/concourse-example.png" class="image fit">

The Cloud Foundry ecosystem has given rise to some amazing things. This series of posts is about two of them - BOSH and Concourse. Together with CF, they form an awesome triangle of tools that will change the way you think about how to get things done when delivering software.

BOSH is the distributed systems powerhouse that makes Cloud Foundry possible. It answers the impossible question: How do you continuously deliver not just an app, but *an entire platform* of distributed virtual infrastructure?

Concourse is a intuitive, cloud-native CI tool that has a powerful simplicity to it. Actually, I'd go so far as to say it's more than just an automation tool, it's a medium for artistic expression! Just have a look at some of the vast Pivotal pipelines (e.g. [the Buildpacks team](https://buildpacks.ci.cf-app.com/)) and marvel at their aesthetic value.

<!--more-->

If you haven’t used Concourse yet you should [visit their site](http://concourse.ci/) and try the Vagrant box locally - you’ll be up and running in just  a few minutes. If you're not familiar with BOSH, stop right now and read about [why you need it](https://bosh.io/docs/about.html). If you want to try out BOSH locally and have a fast laptop with 8-16GB RAM, you should play with [bosh-lite](https://github.com/cloudfoundry/bosh-lite). I can also highly recommend this brilliant [intro tutorial](http://mariash.github.io/learn-bosh/) by [Maria Shaldibina](https://twitter.com/marynixie) at Pivotal.

If you follow this tutorial and deploy a BOSH Director on IaaS, you can then use it to deploy any other [available release](https://bosh.io/releases).  Be careful though - once you’re wielding your new weapon you may want to just go crazy and deploy your whole life using BOSH. You should be aware that there are '7 stages of BOSH’ you must endure to achieve mastery, as humorously explained by [Daniel Jones](http://www.twitter.com/DanielJonesEB) (EngineerBetter) and [Chris Hedley ](http://www.twitter.com/CGHSystems) (Pivotal) at CFSummit Berlin 2015.

The Concourse Vagrant box works like a dream for testing - being able to test your whole pipeline or just individual jobs locally is a killer feature - but eventually you’ll need to take things to the cloud. The aim of this tutorial is to get you up and running with a BOSH director and a fresh deployment of Concourse on AWS. Please remember, the examples provided here are for demo purposes and should not be considered production-ready.

### What does this tutorial cover?

In Part 1 we will do the following:

- Prepare the AWS environment
- Deploy a new BOSH Director using bosh-init
- Login to the Director and set up cloud-config.

In Part 2 we will:

- Create a deployment manifest for Concourse and deploy using BOSH
- Install and get started with the fly cli
- Create our first pipeline in Concourse

In Part 3:

- Update our Concourse BOSH deployment to add a Slack-notifications resource
- Update our pipeline to use the new resource to send Slack notifications

### Setting up

First, clone the GitHub repo accompanying this tutorial:

`git clone https://github.com/EngineerBetter/bosh-concourse-setup`

We're going to use Terraform to express our desired AWS environment as code, so we can put this in source control along with everything else. The terraform configuration we’re using will create the network and security resources for BOSH, but also an elastic load balancer for Concourse with an SSL listener. However, this does assume that you already have the following:

- A [Route53 Zone](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html) you can add records to.
- Created an [SSL certificate](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/ssl-server-cert.html) in AWS for your Concourse ELB

You will also need an EC2 SSH [key pair](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) before you start.

Once you have these, it's time to install some tools! You’ll need to use either Linux or OSX with Ruby installed for the bosh tools. Terraform will work on Windows.

- Install the [terraform](https://www.terraform.io/intro/getting-started/install.html) binaries from Hashicorp
- Install [bosh-init](https://bosh.io/docs/install-bosh-init.html)
- Install the [bosh_cli](https://bosh.io/docs/bosh-cli.html) Ruby gem

### Using Terraform to configure AWS

The Terraform config needs to know about some parameters that are specific to you and your AWS environment. These are defined in `variables.tf` and we set the corresponding values either in environment variables, or a file. You can use the example tfvars file:

{% highlight bash %}

cd terraform
cp variables.tfvars.example variables.tfvars

{% endhighlight %}

Then edit `variables.tfvars` to provide your own values. Set your desired AWS region in `variables.tf`. Ensure terraform is in your path, then apply the configuration:

`terraform apply`

Terraform will execute the plan and save the state of your environment locally. If you need to make any changes, just reapply and it will converge towards your new desired state. A nice feature of terraform is being able to output a dependency graph of your resources. If you have Graphviz installed, you can do this:

`terraform graph | dot -Tpng > graph.png`

Which produces this:

<img src="/images/terraform-graph.png" class="image fit">

You should check the terraform output values and make a note of the elastic IP we'll use for the BOSH director using `terraform output`

###  Deploying a BOSH Director

Now we should have an EIP, VPC, Subnet and Security Groups ready for BOSH.
We're going to create a manifest for `bosh-init`. First you should set the following environment variables:

{% highlight bash %}

$AWS_ACCESS_KEY_ID
$AWS_SECRET_ACCESS_KEY
$AWS_REGION
$AWS_AZ
$BOSH_PASSWORD
$AWS_KEYPAIR_KEY_NAME
$PRIVATE_KEY_PATH

{% endhighlight %}


Then you can go ahead and create the `bosh-director.yml` manifest:

`./bin/make_manifest_bosh-init.sh`


Once this is done, you are ready to deploy the BOSH Director. Are you ready?

`bosh-init deploy bosh-director.yml`

Now go and make yourself a cup of tea - this deployment will take a while.
While you're drinking your tea, why not read [more about BOSH](https://bosh.io/docs)?

Back in your terminal, you should eventually see something like this:

<img src="/images/bosh-init-deploy.png" class="image fit">

### Logging in and setting up cloud-config

Once the director is deployed, you can target it using the bosh cli and login using the admin account and your chosen password.

{% highlight bash %}

bosh target <your elastic ip address>
bosh update cloud-config aws-cloud.yml

{% endhighlight %}

Newer versions of BOSH now use a concept called cloud-config which separates IaaS-specific config like IP addressing from the deployment manifests and makes it an operator rather than user concern.

{% highlight bash %}

bosh update cloud-config aws-cloud.yml

{% endhighlight %}

Congratulations, you have a working BOSH Director!

In Part 2 we will look at using this to deploy Concourse.
