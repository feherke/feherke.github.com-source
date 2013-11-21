---
layout: page
title: mksfx.sh
meta:
  description: Add a shell script header to a compressed file, to make it selfextractor.
date: 2005-07-07
project: Bash-script
directory: mksfx
file:
  - mksfx.sh: script
  - mksfx.sh.1: man page
  - mksfx.sh.pod: man page source
---

# mksfx.sh - make selfextracting compressed file

This one was not written to fit my necessity. And beside this, was written in a hurry. So is not as flexible as could be, but does a nice work. I do not really care
about the number of typed commands, but when I work on a remote machine doing something boring, then I prefer this kind of automation. So the script has good chances
to evolve. Although it is quiet simple to do this by hand :

Bash script
{: .precaption}

{% highlight bash %}
(
cat <<END_OF_TEXT
#! /bin/bash
tail +5 "\$0" | tar xz -C /tmp/whatcompress
/tmp/whatcompress/whatrun.sh
exit 0
END_OF_TEXT
tar cfz - /whatcompress
) > whatcreate.sfx
{% endhighlight %}

## Usage

mksfx.sh makes this easier. You can achieve the above, and evidently even more, with this command :

sample output - `mksfx.sh -x whatcreate.sfx -c gzip -r whatrun.sh /whatcompress`
{: .precaption .icon-screen}

{% commandline %}
SFX /whatcompress -> whatcreate.sh : gzip... sfx... add... Ok
{% endcommandline %}

Only a few parameters are implemented :

sample output - `mksfx.sh --help`
{: .precaption .icon-screen}

{% commandline %}
Make SelFeXtracting archive   version 1.1   august 2008   written by Feherke
create compressed tar of a directory and add an autoextract header
Syntax :
  mksfx.sh [-x sfxname] [-c compression] [-r runname] [directory]
Parameters :
  directory  - name of the directory to compress ( . )
  -x sfxname | --sfx=sfxname  - file name to create ( same as directory )
  -c compression | --compress=compression  - method : gzip, bzip2 ( gzip )
  -r runname | --run=runname  - file to run after uncompressing ( run.sh )
( The values between paranthesis are the default values. )
{% endcommandline %}

## Configuration

None.

The only way duplicated.sh's activity can be influenced, are the command line parameters.

## Versions

* 1.0 - May 2005
  * {: .added} Initial release.

* 1.1 - August 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
  * {: .added} Added GNU-style long option alternatives.
{: .changelog}

## Plans

* {: .pending} Is somehow strange the use of the temporary directory, so it probably will be made optional.
* {: .pending} Also optionally some integrity check would be nice.
* {: .pending} Allow choosing from multiple compression methods.
{: .todo}

## Download

{% include filelist.md %}
