---
layout: page
title: mpc.sh
meta:
  description: Just a rudimental frontend for the most basic music playing functionalities.
date: 2011-05-28
tag: media
bstyle: |
  .s { color: #e5e5e5; }
  .y { color: #cdcd00; }
  .r { color: #cd0000; }
  .bs { color: black; background-color: #e5e5e5; }
  .by { color: black; background-color: #cdcd00; }
  .br { color: black; background-color: #cd0000; }
project: Bash-script
directory: mpc
file:
  - mpc.sh: script
  - mpc.sh.1: man page
  - mpc.sh.pod: man page source
---

# mpc.sh - simple frontend for the mpc client for mpd

In my subconscious I always tried to achieve something like [MPD](http://musicpd.org/ "Music Player Daemon"). And when I discovered it of course I choose
[MPC](http://musicpd.org/clients/mpc/ "Music Player daemon Command-line interface") as client. I really enjoy to start the music with `mpc play`, but there are
situations when you wish to have a faster way too. Certainly there are adequate clients out there and using different clients in different circumstances would
feet the client-server architecture. But I decided to not install, learn, run, maintain another client just for a few occasion. So I wrote this extremely dumb
frontend.

Never intended to be a full featured frontend and certainly never will be. But a playlist switcher with similar look &amp; feel may feet the original idea.

## Usage

mpc.sh simply gets one key press and executes the `mpc` client passing the corresponding parameter :

sample output - `mpc.sh`
{: .precaption .icon-screen}

{% commandline %}
<span class="y">[      no play in progress       ]</span>
<span class="y">----------------------------------</span>
<span class="by">|&lt;</span> <span class="by">&gt;&nbsp;</span> <span class="by">||</span> <span class="br">[]</span> <span class="by">&gt;|</span>  <span class="br">&raquo;&raquo;</span> <span class="by">&iquest;?</span> <span class="by">()</span> <span class="by">.&lt;</span> <span class="by">&gt;&lt;</span>  <span class="by">:=</span>
<span class="s">z  x  c  v  b   r  s  i  a  f   p </span>
<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="by">|</span>--<span class="br">O</span>--<span class="by">|</span>--<span class="by">|</span>  <span class="by">i</span>
<span class="s">m  1  2  3  4  5  6- 7 +8  9  0  ?</span>
{% endcommandline %}

This is not a big bang, I only decided to post it because the used approach gives me very comfortable frontend.
Of course, to be really handy I set the window manager to start it for a specific key combination.

mpc.sh expects no command line parameters from the user. But it uses two special parameters when re-launching itself to display different interfaces :

sample output - `mpc.sh playlist`
{: .precaption .icon-screen}

{% commandline %}
<span class="y">a</span> At Work Channel
<span class="y">b</span> Classical King FM
<span class="y">c</span> Hard Rock Radio
<span class="y">d</span> Italo Disco
<span class="y">e</span> Magic FM
<span class="y">f</span> MelleslegFM
<span class="y">g</span> Rock Radio 1
<span class="y">h</span> Slay Radio
<span class="y">i</span> SwissRadio

<span class="br">a-s</span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span> <span class="bs">   </span>
 1   2   3   4   5   6   7   8   9   0 
current playlist : <span class="r">4</span> entries
load : a..z replace, A..Z append
{% endcommandline %}

sample output - `mpc.sh statinfo`
{: .precaption .icon-screen}

{% commandline %}
mpd version     <span class="r">:</span> <span class="y">0.16.0</span>
mpc version     <span class="r">:</span> <span class="y">0.20</span>
mpc.sh version  <span class="r">:</span> <span class="y">1.6</span>

Artists         <span class="r">:</span> <span class="y">#####</span>
Albums          <span class="r">:</span> <span class="y">#####</span>
Songs           <span class="r">:</span> <span class="y">#####</span>

Play Time       <span class="r">:</span> <span class="y">0 days, 8:15:11</span>
Uptime          <span class="r">:</span> <span class="y">12 days, 1:19:21</span>
DB Updated      <span class="r">:</span> <span class="y">Sat Dec 31 19:36:10 2011</span>
DB Play Time    <span class="r">:</span> <span class="y">#####</span>
<span class="by">ok</span>
{% endcommandline %}

The keys available in the main dialog :

| key                        | command                                 | involved `mpc` command         |
|:--------------------------:|-----------------------------------------|--------------------------------|
| <kbd>z</kbd>               | Starts playing previous song.           | `prev`                         |
| <kbd>x</kbd>               | Starts playing.                         | `play`                         |
| <kbd>c</kbd>               | Pauses playing.                         | `pause`                        |
| <kbd>v</kbd>               | Stops playing.                          | `stop`                         |
| <kbd>b</kbd>               | Starts playing next song on playlist.   | `next`                         |
| <kbd>r</kbd>               | Toggles repeat mode.                    | `repeat`                       |
| <kbd>s</kbd>               | Toggles random mode.                    | `random`                       |
| <kbd>i</kbd>               | Toggles single mode.                    | `single`                       |
| <kbd>a</kbd>               | Jumps back to current song's beginning. | `seek`                         |
| <kbd>f</kbd>               | Toggles crossfade.                      | `crossfade`                    |
| <kbd>m</kbd>               | Sets volume to 0.                       | `volume`                       |
| <kbd>1</kbd>..<kbd>0</kbd> | Sets volume to number\*10%.             | `volume`                       |
| <kbd>+</kbd>               | Increases volume with 10%.              | `volume`                       |
| <kbd>-</kbd>               | Decreases volume with 10%.              | `volume`                       |
| <kbd>p</kbd>               | Open the playlist window.               | `lsplaylists`, `clear`, `load` |
| <kbd>?</kbd>               | Open the status information window.     | `version`, `help`, `stats`     |

The keys available in the playlist dialog :

| key                        | command                                                    |
|:--------------------------:|------------------------------------------------------------|
| <kbd>1</kbd>..<kbd>0</kbd> | Changes playlist to page given by number.                  |
| <kbd>+</kbd>               | Changes playlist to next page.                             |
| <kbd>-</kbd>               | Changes playlist to previous page.                         |
| <kbd>a</kbd>..<kbd>z</kbd> | Clears the current playlist then loads the given playlist. |
| <kbd>A</kbd>..<kbd>Z</kbd> | Loads the playlist assigned to the given letter.           |

## Configuration

None.

## Versions

* 1.0 - May 2008
  * {: .added} Initial release.

* 1.1 - September 2008
  * {: .added} Volume adjusting :
    - mute ( key <kbd>m</kbd> )
    - set volume percentage ( key <kbd>1</kbd>..<kbd>9</kbd> = number\*10% )
    - set volume to maximum ( key <kbd>0</kbd> )

* 1.2 - September 2008
  * {: .added} Title display.

* 1.4 - July 2010
  * {: .added} Progress display.

* 1.5 - November 2010
  * {: .changed} Notice instead of progress for content through http:// .
  * {: .added} Play single entry ( key <kbd>i</kbd> ).
  * {: .added} Toggle 2 second crossfade ( key <kbd>f</kbd> ).
  * {: .added} Playlist loading :
    - display playlist list ( key <kbd>p</kbd> )
    - load playlist exclusively ( key <kbd>a</kbd>..<kbd>z</kbd> )
    - append playlist ( key <kbd>A</kbd>..<kbd>Z</kbd> )

* 1.6 - May 2011
  * {: .added} Play current again ( key <kbd>a</kbd> ).
  * {: .added} Status information ( key <kbd>?</kbd> ).
  * {: .added} Playlist pager :
    - switch to given page ( key <kbd>1</kbd>..<kbd>0</kbd> )
    - switch to next page ( key <kbd>+</kbd> )
    - switch to previous page ( key <kbd>-</kbd> )
{: .changelog}

## Plans

* {: .pending} A few minor configuration pieces for the terminal would be nice.
* {: .done} Remove the playlist limitation, if I will have a good idea for it.
* {: .pending} Implement some simple sticker operations.
{: .todo}

## Download

{% include filelist.md %}
