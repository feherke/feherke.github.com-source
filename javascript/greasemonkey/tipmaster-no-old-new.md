---
layout: page
title: TipMaster - No Old New
meta:
  description: Remove the NEW icon from the old posts.
  keyword: new, post, mark
date: 2013-03-27
tag: TipMaster
project: Greasemonkey-script
directory: tipmaster-no-old-new
file:
  - TipMaster_-_No_Old_New.user.js: script
---

# TipMaster - No Old New

Improves the [TipMaster](http://tipmaster.com/)'s forums, [Tek-Tips](http://tek-tips.com/) and [Eng-Tips](http://eng-tips.com/), by removing the NEW icons from the
already seen posts on the thread pages.

The script saves the posting time of the last post, then on the next visit it removes the NEW icons from all posts with posting time older or equal with the saved one.
Additionally, it jumps again to the first new post in case the location contains the hash for the jump.

To avoid accumulating huge amount of saved last seen times which may put some extra load on the browser, each day it cleans up the data by deleting the last seen times
older than approximately 1 year. ( This can be changed by editing the script. )

## Usage

None. There is nothing interactive.

## Configuration

Configuration not really supported.

But changing how long to keep the last seen times is pretty simple. Just locate the following fragment in the script and change the value ( the default is a formula for
~1 year ) :

TipMaster_-_No_Old_New.user.js - configuration fragment
{: .precaption .icon-file-script}

{% highlight javascript %}
// keep last seen times this long
var expire=365.25*24*60*60*1000
{% endhighlight %}

This script may clash with other Greasemonkey scripts, so you may have to adjust the execution order in your browser :

* [TipMaster - Reply With Quote](tipmaster-reply-with-quote.html) adjusts the height of the post footer, so jumping to the first new post may not be precise. Set this
  script to run _after_ TipMaster - Reply With Quote.
* [TipMaster - Time Ago](tipmaster-time-ago.html) adds relative alternative of the post time inside the same element, so parsing it as date will fail. Set this script to
  run _before_ TipMaster - Time Ago.

## Versions

* 0.0 - January 2012
  * {: .added} Initial release.

* 0.1 - March 2013
  * {: .added} `@grant` metadata imperative according to Greasemonkey 1.0 API.
  * {: .added} Clean up old last seen times.
{: .changelog}

## Plans

* {: .pending} See whether is possible to remove the old NEW icons on the thread list pages too. ( Sadly there the last activity date lacks the time part. )
{: .todo}

## Download

{% include filelist.md %}
