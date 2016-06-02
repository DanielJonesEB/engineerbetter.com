---
layout: post
title:  Up and running with BOSH and Concourse - Part 2.
author: dan
permalink: /bosh-concourse2.html
comments: true
---
<img src="/images/blog/concourse-logo.png">

In Part 2 we will:

- Create a deployment manifest for Concourse and deploy using BOSH
- Install and get started with the fly cli
- Create a pipeline in Concourse
- Add Slack notifications as a new resource type

Set the Concourse URL and password in these environment variables:

{% highlight bash %}
$CONCOURSE_PASSWORD
$CONCOURSE_URL
{% endhighlight %}

Then create a concourse manifest for a single server deployment:

`./bin/make_manifest_concourse.sh`

Or, create a concourse manifest for small cluster:

`./bin/make_manifest_concourse-cluster.sh`

Upload the necessary stemcell & releases, then deploy concourse:

{% highlight bash %}
bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent
bosh upload release https://bosh.io/d/github.com/concourse/concourse
bosh upload release https://bosh.io/d/github.com/cloudfoundry-incubator/garden-linux-release
bosh deployment concourse.yml
bosh deploy
{% endhighlight %}

Congratulations, you should now be able to see your new CI server at https://your-concourse-url.

Next, it's time to get familiar with the `fly` cli tool. You'll find the download link on landing page of your new Concourse GUI (known as the ATC/Air Traffic Control).
