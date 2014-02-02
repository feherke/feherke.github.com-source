---
layout: page
title: cookieclean.sh
meta:
  description: Cleans up the Mozilla cookie file removing unwanted items.
date: 2008-09-05
tag: cleanup
status: [stable, inactive]
project: Bash-script
directory: cookieclean
file:
  - cookieclean.sh: script
  - cookieclean.ini: configuration
  - cookieclean.ok: whitelist
  - cookieclean.sh.1: man page
  - cookieclean.sh.pod: man page source
---

# cookieclean.sh - deletes cookies, except a whitelist

Newer Mozillas have an option to permit cookies from certain site only for one session. This is closer to what I want, but still not exactly the same. I want to accept
cookies from all sites and keep them all day long. Then the next day to start navigation without those cookies, excepting a few of them which I want to keep.

The cookieclean.sh script cleans up the cookies.txt files, and starting with FireFox 3 the cookies.sqlite files, leaving only those cookies I want to keep.

For cleaning cookies.sqlite file, the `sqlite3` tool is needed. Its existence is not checked, I consider it part of a standard distribution, so like I not check for the
existence of `grep`, I will not check neither for `sqlite3`.

## Usage

This script was designed to be run from `cron`, so it outputs its messages to a log file. Excepting of course unexpected and unhandled errors...

It is as least communicative as possible. It does not accept any parameter and outputs nothing to the standard output or error.

## Configuration

The configuration file

* is mandatory
* can be specified in command line
* by default is located in the same directory with the script
* by default has the same name with the script, with _.sh_ extension removed and _.ini_ extension added
* has [INI](http://en.wikipedia.org/wiki/INI_file) format without sections

cookieclean.ini - sample configuration
{: .precaption .icon-file-config}

{% highlight ini %}
# Cookie Clean   version 1.3   august 2008   written by Feherke
# cleans up the Mozilla cookie file removing unwanted items
# - configuration file -

# all values are subject of variable expansion :
#  - $scriptname - the name of the script without .sh extension
#  - $scriptdir - the directory where the script resides
#  - $HOME, $TEMP, ... - usual environment variables

# path to the profile directory ( deprecated, use profile key )
#mozilla=/home/master/.mozilla/default/v5rkwo4n.slt/

# path to the profile directory
# you can use multiple profile keys
profile=/home/master/.mozilla/firefox/xie5eflf.default/
profile=/home/master/.mozilla/seamonkey/e81zpwiz.default/
profile=/home/master/.phoenix/default/10z08gzf.slt/
profile=/home/master/.gnome2/epiphany/

# list of permitted hosts
okfile=${scriptdir}/cookieclean.ok

# found unpermitted hosts
badfile=${scriptdir}/cookies---.bad

# activity log
logfile=${scriptdir}/${scriptname}.log

# permitted hosts cache file
cachefile=/tmp/${scriptname}-cache.txt
cachefile3=/tmp/${scriptname}-cache3.txt
{% endhighlight %}

The white list is an enumeration of allowed domains. I mean, the _exact_ domains, as set by the cookies. So no wildcard, regular expression or partial name is available.

cookieclean.ok - sample configuration
{: .precaption .icon-file-config}

{% highlight ini %}
# Cookie Clean   version 1.3   august 2008   written by Feherke
# cleans up the Mozilla cookie file removing unwanted items
# - accepted hosts list -

# empty lines are discarded, use a single dash ( - ) to say no host

-
.google.com
.google.ro

tek-tips.com
.tek-tips.com
www.tek-tips.com
{% endhighlight %}

## Versions

* 1.0 - July 2004
  * {: .added} Initial release as AWK script.

* 1.1 - 2008
  * {: .changed} Complete rewrite as Bash script.

* 1.2 - 2008
  * {: .added} Added FireFox 3 support, to clean up cookies stored in SQLite database.

* 1.3 - August 2008
  * {: .added} Cache the expressions built from the allowed hosts list.
{: .changelog}

## Plans

In meantime Mozillas' cookie handling and the available extensions evolved, so this script became somehow deprecated. There is good chance the plans will remain plans
forever.

* {: .pending} Protection against SQL injection.
* {: .done} Maybe an automatically generated cleaning statistic.
* {: .cancelled} Maybe an automatically generated cleaning statistic.
{: .todo}

## Download

{% include filelist.md %}
