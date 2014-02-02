---
layout: page
title: Mars Text
meta:
  description: Theme with redish color palette using textual buttons.
date: 2013-02-10
tag: theme
status: [stable, active]
bstyle: |
  p.sample {
    color: #c0c000;
    font-family: Courier New,Courier,monospace;
    font-size: 12px;
    font-weight: bold;
    background-color: #300000;
    margin-top: 0;
  }
  p.sample strong {
    display: inline-block;
    padding: 3px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 5px;
  }
  p.sample strong.active {
    background-color: #000000;
  }
  p.sample strong.inactive {
    background-color: #900000;
  }
  p.sample strong.minimized {
    background-color: #600000;
  }
  .precaption+p {
    border-style: solid;
    border-color: #336;
    border-width: 1px;
    padding: 3px;
    margin-bottom: 15px;
  }
project: IceWM-theme
directory: mars-text
file:
  - default.theme: theme preferences
  - closeA.xpm: image
  - closeI.xpm: image
  - depthA.xpm: image
  - depthI.xpm: image
  - hideA.xpm: image
  - hideI.xpm: image
  - maximizeA.xpm: image
  - maximizeI.xpm: image
  - menuButtonA.xpm: image
  - menuButtonI.xpm: image
  - minimizeA.xpm: image
  - minimizeI.xpm: image
  - restoreA.xpm: image
  - restoreI.xpm: image
  - rolldownA.xpm: image
  - rolldownI.xpm: image
  - rollupA.xpm: image
  - rollupI.xpm: image
  - titleAL.xpm: image
  - titleAM.xpm: image
  - titleIL.xpm: image
  - titleIM.xpm: image
  - mailbox/errmail.xpm: image
  - mailbox/mail.xpm: image
  - mailbox/newmail.xpm: image
  - mailbox/nomail.xpm: image
  - mailbox/unreadmail.xpm: image
  - taskbar/collapse.xpm: image
  - taskbar/expand.xpm: image
  - taskbar/linux.xpm: image
  - taskbar/showdesktop.xpm: image
  - taskbar/windows.xpm: image
---

# Mars Text

Actually this is a remake of the old Mars Text theme I put together when I started using [IceWM](http://www.icewm.org/).

Originally this was intended to be the predecessor of a fully graphic Mars theme, but then I liked this one so much that I gave up with the sequel.

## Screenshot

desktop fragment with Mars Text
{: .precaption .icon-screenshot}

![screenshot using the theme](mars-text.png)

## Usage

There is nothing special in its usage, however I found that some spectators got confused occasionally by the palette. They expected the window with the lighter title bar
to be the active one, but in Mars Text the active/selected element is always the one with black background :

palette sample
{: .precaption}

**Inactive window**{: .inactive}
**Active window**{: .active}
**Inactive window**{: .inactive}
**Minimized window**{: .minimized}
{: .sample}

## Configuration

Configuration not really supported.

All you can do is configure IceWM itself. I intended to set up everything, even for features I not use. But still there are some dark spots I not understand. ( See the
Plans section below for details. )

## Versions

* 0.0
  * {: .added} Initial release.
* 0.1 - February 2013
  * {: .added} Remake.
{: .changelog}

## Plans

* {: .pending} Find out the reason of not using the image of show desktop button and fix it.
* {: .pending} Find out where may scrollbar appear and set its colors.
* {: .pending} Find out how APM monitor looks and set its colors.
* {: .pending} Maybe draw a few application icons to match the theme.
{: .todo}

## Download

{% include filelist.md %}
