---
layout: page
title: psqall.sh
meta:
  description: Runs the psql tool in a loop for more databases of the same server.
date: 2012-11-13
status: [stable, inactive]
project: Bash-script
directory: psqall
file:
  - psqall.sh: script
  - psqall.ini: configuration
  - psqall.sh.1: man page
  - psqall.sh.pod: man page source
---

# psqall.sh - execute SQL commands on more databases

I missed a tool like this since long time. And of course I tried to write it, but that time I was beginner, so the result was useless. Then I wrote it in Perl and was
happy with that. Although it was limited to what I implemented. Now I remembered my initial plan and wrote this script as I always wanted it : just a loop to cycle
through the list of databases and run `psql` passing the received parameters to it.

It requires Bash version 4.0 because uses the `mapfile` builtin. Even without that, the compatibility with older versions is compromised by the differences in handling
some special characters in shell patterns.

Most of the parameters and the configuration file are serving only one purpose : to set the list of databases to include or exclude from the list. The possibility to
have the excluded databases in a file simplifies its use.

## Usage

sample output - `psqall.sh -c 'select max(date) from log'`
{: .precaption .icon-screen}

{% commandline %}
PSQalL   version 1.1   november 2012   written by Feherke
execute SQL commands on more databases
=== alpha ===
              max              
-------------------------------
 2008-01-30 13:50:27.652215+02
(1 row)

=== beta ===
              max              
-------------------------------
 2008-10-16 12:09:43.489163+03
(1 row)

=== blah ===
ERROR:  Relation "log" does not exist
=== gamma ===
              max              
-------------------------------
 2007-01-31 19:53:57.279145+02
(1 row)
{% endcommandline %}

sample output - `psqall.sh -t -A -L -c 'select max(date) from log'`
{: .precaption .icon-screen}

{% commandline %}
PSQalL   version 1.1   november 2012   written by Feherke
execute SQL commands on more databases
alpha === 2008-01-30 13:50:27.652215+02
beta  === 2008-10-16 12:09:43.489163+03
ERROR:  Relation "log" does not exist
gamma === 2007-01-31 19:53:57.279145+02
{% endcommandline %}

The output is not filtered or altered so both the output data and the `psql` error messages are formatted in their expected way.

## Versions

* 0.0 - May 2004
  * {: .added} Initial release, in Perl.

* 1.0 - December 2008
  * {: .changed} Rewritten in Bash.

* 1.1 - November 2012
  * {: .changed} `-y` option changed to `-D`.
  * {: .added} New configuration entry, `include`.
  * {: .added} New configuration entry, `lineprefix`.
  * {: .removed}  `-r`, `--regular-expression` switch removed.
{: .changelog}

## Plans

* {: .done} Handling of input.
* {: .pending} Maybe handling of joined short parameters.
{: .todo}

## Download

{% include filelist.md %}
