---
layout: page
title: duplicated.sh
meta:
  description: Create a list of all duplicated files based on comparing their checksums.
date: 2007-03-26
tag: cleanup
project: Bash-script
directory: duplicated
file:
  - duplicated.sh: script
  - duplicated.sh.1: man page
  - duplicated.sh.pod: man page source
---

# duplicated.sh - search for duplicated files

An e-friend wanted to search for duplicated files on his machine, but did not know how. He wrote me this : "Although I know you have a shell script for this purpose,
that does not help me too much on xp."
Two mistakes : 1) no, I did not had such script; 2) yes, shell scripts can help on market leader operating system too.

So I wrote duplicated.sh and run it in [CygWin](http://cygwin.com/). Works perfectly. Sadly, I can not tell the same about my other two tries :

* Perl - unstable. When did not like something, crashes.
* Java - slooow. With 32 Mb input buffer size works abit faster, but still not a champion.

duplicated.sh had to deal with 27.67 Gb data. At the end it displays the execution time. And I am satisfied by it.

## Usage

sample output - `duplicated.sh --help`
{: .precaption .icon-screen}

{% commandline %}
duplicated.sh   version 1.4   august 2008   written by Feherke
search for multiple files with the same content

Syntax :
  duplicate.sh [-s size] [-a algorithm] [directory [...]]

Parameters :
  -s size | --size=size  - file size in bytes, smallers are not checked ( 0 )
  -a algorithm | --algo=algorithm  - checksum algorithm : MD5 or SHA1 ( MD5 )
  directory  - directory with path to include in the search ( . )

All searches are recursive.
{% endcommandline %}

It only generates a duplication list, dealing with the duplicates is left to the user :

sample output - `duplicated.sh`
{: .precaption .icon-screen}

{% commandline %}
duplicated.sh   version 1.2   march 2007   written by Feherke
searches for multiple files with the same content
creating temporary directory... Ok ( tmp.oDYUuq2932 )
creating file list... Ok ( 890340, error 7707 )
searching for duplicated file sizes... Ok ( 25028 )
creating list of potential duplicated files... Ok ( 872781 )
collecting MD5 checksums... Ok ( 871992, error 789 )
searching for duplicated checksums... Ok ( 98577 )
creating list of duplicated files... Ok ( 725121 )
creating result list... Ok ( duplicate.txt )
cleaning up temporary data... Ok ( 352M )
all done in 1 hours 50 minutes 28 seconds.
{% endcommandline %}

The numbers mentioned as errors above, are the caused by files and directories not accessible for any kind of user.

## Configuration

None.

The only way duplicated.sh's activity can be influenced, are the command line parameters.

## Versions

* 1.0 - 2006
  * {: .added} Initial release, just a proof of concept compared to similar Java and Perl implementations.

* 1.1
  * {: .changed} Transformed into usable script.

* 1.2 - April 2007

* 1.3 - March 2007
  * {: .changed} Changed to work with older `md5sum` versions too.
  * {: .added} New `-s` size parameter to exclude small files
  * {: .added} New `-a` algorithm parameter to set the checksum algorithm used for comparing ( MD5 and SHA1 supported )

* 1.4 - August 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
{: .changelog}

## Plans

* {: .pending} Work with more checksum tools, for example `openssl`.
* {: .pending} Add another comparison before calculating checksums. Either directly compare `head` output or the checksum of `head`.
{: .todo}

## Download

{% include filelist.md %}
