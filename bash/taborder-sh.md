---
layout: page
title: taborder.sh
meta:
  description: Reorders the controls in the XFM file based on the declarations in the Pas file.
date: 2010-09-20
status: [stable, inactive]
project: bash-script
directory: taborder
file:
  - taborder.sh: script
  - taborder.sh.1: man page
  - taborder.sh.pod: man page source
---

# taborder.sh - changes the `TabOrder` in form

When a form has more than 100 controls, setting the tabbing order through the Delphi/Kylix IDE form designer's Edit Tab Order dialog becomes abit tedious.

This script helps abit to automate the manual taborder changing. First the component declarations have to be put in the desired order in the source file ( .pas ),
then this script rearranges the form file ( .xfm ) moving the sections of each component in the same order as they are in the source file and edits the `TabOrder`
property values according to the new order. Unless altered later by some editing, the received order is trustfully constant.

taborder.sh is not configurable, its only parameter is the file name. Additionally it checks some environment variables to see where to put temporary data.

sample output - `taborder.sh ~/project/src/uhugeform`
{: .precaption .icon-screen}

{% commandline %}
TabOrder   version 2.0   august 2010   written by Feherke
reorders the controls in the XFM file based on the declarations in the Pas file
identifying the form... ok, uhugeform
checking the files... ok
checking the structure... ok
identifying the class... ok, Tfrmhugeform
checking consistency... ok
creating temporary directory... ok, /tmp/taborder-5Kxx9Y
creating control list... ok, 323
splitting up... ok
rebuilding &amp; renumbering... ok
renaming the original... ok, 0
recreating the file... ok, uhugeform.xfm
deleting temporary files... ok
{% endcommandline %}

Of course, this script can be easily fooled if the .pas file is messed up. But I do not intend to write a full featured Pascal parser.

## Configuration

## Versions

* 1.0
  * {: .added} Initial release.

* 2.0 - August 2010
  * {: .added} Complete rewrite, for Bash 4.
{: .changelog}

## Plans

* {: .pending} Read pieces up to a semicolor ( ; ), not to line end.
* {: .pending} Handle comments.
{: .todo}

## Download

{% include filelist.md %}
