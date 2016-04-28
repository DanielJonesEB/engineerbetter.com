---
layout: post
title:  "The second post"
date:   26/04/2016
author: Dan Young
permalink: /second-post.html
---

## This is an H2 heading

### This is an H3 heading

This is an example Gemfile

{% highlight ruby %}

source 'https://rubygems.org'
ruby "2.3.0"

gem 'jekyll'
gem 'html-proofer'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'capybara-webkit'
end

{% endhighlight %}


And so here is a list:

- this is a list item
- this is another item

And some more code

{% highlight html %}

<a href="#">Hello world</a>

{% endhighlight %}
