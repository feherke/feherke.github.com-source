---
layout: page
title: killrenegade.sh
meta:
  description: Kill the processes with given name which use to much resources.
date: 2005-07-24
tag: cleanup
status: [stable, dormant]
project: Bash-script
directory: killrenegade
file:
  - killrenegade.sh: script
  - killstatistic.awk: script
  - killrenegade.ini: configuration
  - killrenegade.sh.1: man page
  - killrenegade.sh.pod: man page source
---

# killrenegade.sh - kill processes exceeding limits

First was the operamotifwrapper, then the nerves. The first is a program which sometimes spins up the processor to 100%, affecting seriously the second. With short
[googling](http://google.com/search?q=operamotifwrapper "search : operamotifwrapper") on this subject, seems to be a plugin problem and Opera has nothing to do. The
usual solution shared on forums was to kill it manually, because anyway it occurs only after closing the browser. No, it does not. The operamotifwrapper rampage is a
daily incident even without closing the browser. So I needed something to check it periodically and kill it as necessary.

## Usage

Was designed to run daemonically, so is not interactive. The hunting is controlled through a setting file, and the activity is logged.

sample output - `killrenegade.sh --help`
{: .precaption .icon-screen}

{% commandline %}
killrenegade   version 1.2   august 2008   written by Feherke
kill the processes with given name which use to much resources
Syntax :
  killrenegade.sh [-i inifile] [-V]
Parameters :
  -i inifile | --ini=inifile  - settings file to be read ( killrenegade.ini )
  -V | --verbose  - verbose mode, use twice for more verbose ( no )
{% endcommandline %}

By default killrenegade.sh is not too conversational :

sample output - `killrenegade.sh`
{: .precaption .icon-screen}

{% commandline %}
killrenegade   version 1.1   july 2005   written by Feherke
reading settings... ok, 3 sections found
verifying settings... ok, defaults used where needed
running as feherke, restrictions applied
started on Mon Jul 25 13:09:18 EEST 2005, Ctrl-C to stop...
{% endcommandline %}

Anyway, it's more then killstatistic.awk's output. Which spokes none but works well. Transforms a 10000 record log of 15 users, 20 commands and 31 signals in bit more
then 5 seconds. During this, reads 1 file of 0.5 Mbytes and creates 512 files of totally 8 Mbytes. ( And this is the reason why I do not post a statistic sample. )

## Configuration

The configuration file

* is mandatory
* can be specified in command line
* by default is located in the same directory with the script
* by default has the same name with the script, with _.sh_ extension removed and _.ini_ extension added
* has [INI](http://en.wikipedia.org/wiki/INI_file) format

killrenegade.ini - sample configuration
{: .precaption .icon-file-config}

{% highlight ini %}
# killrenegade   version 1.1   july 2005   written by Feherke
# kill the processes with given name which use to much resources

# general options
[general]
# plain text log file of the kills
# empty means no log
logfile=killrenegade.log
# directory for HTML version of the kill log
# empty means no statistics
htmldir=public_html/killrenegade
# rebuild the HTML statistics after this time
# units : seconds
build=30

# default settings for values not set in sections
[default]
# command name to kill
# can not be empty
# default : none
command=
# list of users distinguished from others
# dash ( '-' ) means empty list
# separator : space
# default : root
user=root
# ownership relation of users and processes
#  yes : kill only processes owned by users is list
#  no : do not kill processes owned by users in list
# default : no
belong=no
# percentage of processor used
# type : integer
# default : 10
processor=10
# percentage of memory used
# type : integer
# default : 25
memory=25
# list of signals to send to the processes
# separator : space
# type : number or name
# default : SIGTERM
signal=SIGTERM
# sleeping interval between checks
# units : seconds
# default : 60
interval=60

[omw]
command=operamotifwrapper
processor=15
memory=30
signal=SIGKILL
interval=3
{% endhighlight %}

## Versions

* 1.0
  * {: .added} Initial release, as killoperamotifwrapper.sh .

* 1.1 - July 2005
  * {: .added} Made configurable and able to kill any process.

* 1.2 - August 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
  * {: .added} Added GNU-style long option alternatives.
{: .changelog}

## Plans

* {: .pending} Maybe a clemency option, to not kill processes the first time they are caught over limit.
{: .todo}

## Download

{% include filelist.md %}
