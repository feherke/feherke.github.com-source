---
layout: page
title: onceaday.sh
meta:
  description: Run commands enumerated in a configuration file, conditionally, only once a day.
date: 2008-08-30
tag: notification
status: [stable, active]
project: bash-script
directory: onceaday
file:
  - onceaday.sh: script
  - onceaday.ini: configuration
  - onceaday.sh.1: man page
  - onceaday.sh.pod: man page source
---

# onceaday.sh - run commands only once a day

The utility of this script is disputable, but I decided to publish it, just because I like it. Because I like working with text files and the crontab-like time patterns
always fascinated me.

Simply I wanted something to show me some reminders, notices, anything when I start to work at my computer. In my case, this mean, when I open the first interactive
shell. So the best method is to put it in the shell's personal initialization file and save the last run's timestamp somewhere in a file. But this would be boring
simple, so I added timestamp conditions to the configuration file.

onceaday.sh by default does not print anything to not mess up the output of the run commands. The below output was obtained with the `-a` `-s` parameters on January
1<sup>st</sup> :

sample output - `onceaday.sh -a -s`
{: .precaption .icon-screen}

{% commandline %}
fortune
cat /home/master/holiday-warning.txt
{% endcommandline %}

The initial idea was to make it functional even by sourcing it or run properly. But I realized, that sourced files loose their identity, and can not find out their name
and path, so can get its configuration file. So I renounced to this idea. Anyway, if I will find a bulletproof solution without using hardcoded reference points,
probably I will rewrite this script.

## Configuration

onceaday.ini looks like a usual crontab file, with the usual 5 time fields and 1 command. With one twist : while in traditional crontab there is an _or_ operation
between the day of month and day of week checks, in onceaday.ini there are _and_ operations between all checks.

The time can be specified as ( examples expanded as in case of month ) :

- asterisk ( \* -> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 )
- number ( 1 -> 1 )
- list ( 1,3 -> 1, 3 )
- range ( 1-3 -> 1, 2, 3 )
- range with step ( \*/2 -> 1, 3, 5, 7, 9, 11 )
- combinations of the above

For more see the sample onceaday.ini provided with the script.

The command can be :

- script ( file without execute permission ) - gets `source`d
- text ( file without execute permission and txt extension ) - gets `cat`ed
- command ( anything else ) - attempted to be executed

onceaday.ini - sample configuration
{: .precaption .icon-file-config}

{% highlight ini %}
* * * * * fortune
* * 1,2 1 * ~/holiday-warning.txt
* * 14 2 * figlet I hate this day
{% endhighlight %}

## Versions

* 1.0 - December 2005
  * {: .added} Initial release.

* 1.1 - August 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
  * {: .added} Added GNU-style long option alternatives.
{: .changelog}

## Plans

* {: .pending} Abit more error checking and maybe a parameter to print debug information while running.
{: .todo}

## Download

{% include filelist.md %}
