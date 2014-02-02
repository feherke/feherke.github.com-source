---
layout: page
title: symlink_ntfs.sh
meta:
  description: Restores symlinks after copying them to NTFS and back.
date: 2011-05-01
tag: recovery
status: [stable, inactive]
project: bash-script
directory: symlink_ntfs
file:
  - symlink_ntfs.sh: script
  - symlink_ntfs.sh.1: man page
  - symlink_ntfs.sh.pod: man page source
---

# symlink_ntfs.sh - restores symlinks copied from NTFS

When a symlink is copied to an NTFS partition then back to ReiserFS, it is transformed into regular file. ( Note that I not researched on this subject, there could be
ways to avoid this. Certainly one workaround exists : tar them before copying. But I copied from defectuous harddisk and I did not wanted to risk to corrupt possibly
good files by archiving them together with bad ones. )

For example in case of the UltraBlack IceWM theme originally was this :

sample output - `ls -l .icewm/themes/UltraBlack/maximizeA.xpm`
{: .precaption .icon-screen}

{% commandline %}
lrwxrwxrwx 1 master master 10 May  1 18:37 .icewm/themes/UltraBlack/maximizeA.xpm -> closeA.xpm
{% endcommandline %}

But during the copying it was transformed into this :

sample output - `od -t ax1 .icewm/themes/UltraBlack/maximizeA.xpm`
{: .precaption .icon-screen}

{% commandline %}
0000000   I   n   t   x   L   N   K soh   c nul   l nul   o nul   s nul
         49  6e  74  78  4c  4e  4b  01  63  00  6c  00  6f  00  73  00
0000020   e nul   A nul   . nul   x nul   p nul   m nul
         65  00  41  00  2e  00  78  00  70  00  6d  00
{% endcommandline %}

symlink\_ntfs.sh restores the symlink in the shortest and simplest way :

sample output - `symlink_ntfs.sh`
{: .precaption .icon-screen}

{% commandline %}
Symlink back from NTFS   version 0.0   may 2011   written by Feherke
corrects symlinks copied back from NTFS
.icewm/themes/UltraBlack/maximizeA.xpm -> closeA.xpm... ok
{% endcommandline %}

As this script hopefully will be never used again, there are very few error checks. To avoid data lost, it can be asked to rename the files instead of removing them.

## Configuration

None.

## Versions

* 1.0 - May 2011
  * {: .added} Initial release.
{: .changelog}

## Plans

None.

## Download

{% include filelist.md %}
