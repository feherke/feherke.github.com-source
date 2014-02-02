---
layout: page
title: Logger
meta:
  description: Logger class tailored for personal taste.
  keyword: logger
date: 2013-12-03
tag: module
status: [outdated, inactive]
project: Ruby-script
directory: logger
file:
  - logger.rb: script
bscript: |
  window.addEventListener('load', function() {
    var http = new XMLHttpRequest()
    http.open('GET', 'https://api.github.com/search/repositories?q=logger+language:ruby&per_page=1', false)
    http.addEventListener('load', function(e) {
      var data = JSON.parse(e.target.response)
      if (! data) return
      if (! ('total_count' in data)) return

      var many = document.getElementById('many')
      if (! many) return

      many.textContent = data.total_count
    }, false)
    http.send(null)
  }, false)
---

# Logger

My first serious encounter with logging was in Java. There logging is like
exception handling : so complex that you actually have to build up a secondary
logic beside the main flow.

So in Ruby I wanted something closer to Ruby's way : lightweight and efficient.

Probably there are dozens of loggers out there... ( Wait a moment. Let us see
how many [logger repositories are on GitHub](https://github.com/search?l=Ruby&q=logger&type=Repositories).
Well, there are <span id="many">many</span>. )

## Usage

Just instantiate a `Logger` object, set it up as you need, then call its methods whenever you fill appropriate :

sample code -- using `Logger`
{: .precaption .icon-code}

{% highlight ruby %}
require_relative 'logger'

# default logger : writes to STDOUT messages of level INFO and above
$log = Logger.new

# this will be logged
$log.log Logger::INFO, "Hello World !"

# this not as message's level is inferior to logger's level
$log.debug "Waiting for response..."

# but if we adjust the level...
$log.level = Logger::TRACE

# ... then DEBUG messages will also be logged
$log.debug "Loosing my patience..."

# or we can adjust the log line format
$log.logformat = "on %d{\%d %B at %H:%M} the %x running with PID %p generated exception %e with message %m"

# and can log unconditionally, without specifying a message level
$log << "Goodbye, cruel World :("

# after a caught exception the %e placehold will have a value
0 / 0 rescue $log << "Goodbye again :(("

# but not in the later message
$log << "That's All Folks"

# well, not really necessary if you log to STDOUT, but a good practice
$log.close
{% endhighlight %}

sample log
{: .precaption .icon-file}

    2013-12-03 16:56:59     INFO    Hello World !
    2013-12-03 16:56:59     DEBUG   Waiting for response...
    2013-12-03 16:56:59     DEBUG   Loosing my patience...
    on 03 December at 16:56 the sample.rb running with PID 8728 generated exception  with message Goodbye, cruel World :(
    on 03 December at 16:56 the sample.rb running with PID 8728 generated exception divided by 0 with message Goodbye again :((
    on 03 December at 16:56 the sample.rb running with PID 8728 generated exception  with message That's All Folks


## Configuration

None.

## Versions

* 0.0 - April 2009
  * {: .added} Initial release.

* 0.1 - December 2013
  * {: .changed} Adjusted to Ruby syntax changes.
{: .changelog}

## Plans

* {: .pending} Conditional fragments, similar to WinAmp ATF : "[] means <<don't display unless metadata was found>>."
* {: .pending} ANSI colored log levels when logging to STDOUT.
* {: .pending} Access instances through the `Logger` class to avoid using global variables.
{: .todo}

## Download

{% include filelist.md %}
