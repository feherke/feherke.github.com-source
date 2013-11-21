---
layout: page
title: buzz.sh
meta:
  description: Schedules an at job to pop up a message using various commands.
date: 2013-02-02
tag: notification
project: Bash-script
directory: buzz
file:
  - buzz.sh: script
  - buzz.sh.1: man page
  - buzz.sh.pod: man page source
---

# buzz.sh - displays a predefined message at a given time

There are all kind of scheduling and alerting tools. For example [ReminderFox](https://addons.mozilla.org/en-US/firefox/addon/1191), which I actually use.
But most of them are quite feature full and usually even if you can omit many of the details you still have to specify at least a message. Often I want an alert the same
day, just to make me look at the clock and remember that I planed to do something. Using the usual tools for such simple task is like shooting sparrow with cannon.

When using buzz.sh only the time is mandatory. The time format is very flexible, due to the `at` command's flexibility.

The message can be displayed with the first command found in the list. Currently : `xmessage`, `Xdialog`, `kdialog`, `gdialog`, `zenity`, `yad`, `gxmessage`, `gtkdialog`,
`xterm`, `eterm`, `aterm`, `terminal`, `konsole`, `vte`, `rxvt`, `gnome-terminal`. If none of the commands is found, the message will be simply output, so the `atd` will
send it to the local mailbox.

## Usage

sample output - `buzz.sh --help`
{: .precaption .icon-screen}

{% commandline %}
Buzz !   version 1.3   february 2013   written by Feherke
displays a predefined message at a given time

Syntax :
  buzz time

Parameters :
  time  - absolute or relative time, as required by at :
    H day-part
    HH:MM [month-name DD [YY[YY]]]
    HH:MM DD.MM.YY
    now + count time-unit
{% endcommandline %}

The script's only functionality is scheduling a buzz. For scheduled job list manipulation use the `at`'s utilities : `atq` for listing, `atrm` for revoking.

sample output - `buzz.sh 18:45`
{: .precaption .icon-screen}

{% commandline %}
Buzz !   version 1.1   september 2008   written by Feherke
The message will be displayed using xmessage
warning: commands will be executed using /bin/sh
job 75 at Sat Aug 30 18:45:00 2008
{% endcommandline %}

The last two lines may vary as they are the output of the `at` command.

## Configuration

Configuration not really supported.

But you could edit the order of preferred commands and the predefined message. Note that you can remove items from `commandlist`, but adding will not work.

buzz.sh - fragment with hardcoded configuration
{: .precaption .icon-file-script}

{% highlight bash %}
# order of preferred commands
commandlist=( 'xmessage' 'Xdialog' 'kdialog' 'gdialog' 'zenity' 'yad' 'gxmessage' 'xterm' 'eterm' 'aterm' 'terminal' 'konsole' 'vte' 'rxvt' )

# predefined message
title='Buzz !'
button='Yes, thank You'
message=" Excuse me Sir, this is Your
|~|_    _  _   ___   ___  |~|
| / \  | || | |__ | |__ | | |
|  O ) | || |  / /   / /  |_|
|_\_/  \__/_| |___| |___| (_)

 *   --==[ \$( date +%H:%M:%S ) ]=--   *

( Buzz was set at $( date +%H:%M:%S ). )"
{% endhighlight %}

## Versions

* 1.0 - May 2004
  * {: .added} Initial release.

* 1.1 - September 2008
  * {: .added} Alerts with the first tool found in a list of 10 notification tools :
        `xmessage`, `Xdialog`, `kdialog`, `gdialog`, `zenity`, `xterm`, `eterm`, `aterm`, `terminal`, `konsole`

* 1.2 - November 2010
  * {: .added} Added 3 more notification tools :
        `yad`, `vte`, `rxvt`

* 1.3 - February 2013
  * {: .added} Added 3 more notification tools :
        `gxmessage`, `gtkdialog`, `gnome-terminal`
{: .changelog}

## Plans

* {: .pending} Add more tools, for example `gaffel`.
* {: .pending} Rewrite it all to make it configurable and modular.
{: .todo}

## Download

{% include filelist.md %}
