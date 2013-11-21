---
layout: page
title: OSD Chain
meta:
  description: OSD display controlled with chained conditions.
date: 2012-02-21
tag: notification
project: Irssi-script
directory: osd-c
file:
  - osd-c.pl: script
---

# OSD Chain

Inspired by the [osd](http://vipie.studentenweb.org/dev/irssi/) script by Jeroen Coekaerts and Koenraad Heijlen. I used it and was happy with it. Thank you, guys.

This script implements a controlling mechanism for filtering the messages. It uses a rule list which is traversed for each message. If the message's circumstances met
the conditions of a rule, the rule's status is applied to the message. The last status indicates whether the message is displayed in OSD.

Each rule has the following data :

* id - order number used to sort the messages and to refer to them when altering
* conditions : type, channel, sender - if a condition is not set or is set and matched the current message, the rule is applied
* status - **on** or **off** meaning display or not display
* final - if the rule is matched, traversing the list stops without checking any further rules

## Usage

Excerpt from the `/osd-c help` command's output :

sample output
{: .precaption .icon-screen}

<pre><samp markdown="span"
>Syntax :
  osd-c [command]

Available commands :
 - add rule  - add a new rule to the end of rule chain
 - put id rule  - insert a new rule in position id of the rule chain
 - set [id] rule  - change the rule identified by its id or add it
 - delete id  - delete an existing rule
 - move id newid  - move an existing rule to a new position in the chain
 - list  - list the rules currently in the chain
 - restart  - restart the osd_cat, useful after modifying the parameter setting
 - test [text] - output a test message

rule   := **set** type [**on** channel] [**from** nick] status [**final**]
type   := **public**|**private**|**hilite**|**invite**|**move**
status := **on**|**off**

Without command displays the current rules.

Available aliases :
 - add - append
 - put - insert
 - set - let
 - delete - remove, unset, del, rm
 - move - mv
 - list - ls
 - restart - reload, refresh, re
 - test - try, demo, show
</samp></pre>{::comment}){:/}

Joined a too noisy channel ? `/osd-c add public on #channel_name off`  
Bothered by a too chatty bot ? `/osd-c add from bot_name off`  
Just want to relax with a movie ? `/osd-c add`  

At first sight that last command will stop all messages. Nope. Will stop only messages which reached the end of chain. But messages which matched a rule with both **on**
and **final** will still appear. Maybe you indeed want them. Or maybe not. Personally I start my rule list with an empty rule with status **on**, so later I can use
`/osd-c set 0 off final` to really stop everything.

## Configuration

Use the `/set` command to configure this script, except the rule. Use the `/osd-c` commands to manipulate the rules.

The parameter setting is used only when starting `osd_cat`, so changes will not be visible automatically, use `/osd-c restart` to apply its changes.

| Setting               | Type    | Description                                       | Default                                                          |
|-----------------------|---------|---------------------------------------------------|------------------------------------------------------------------|
| `osd-chain_parameter` | string  | command line parameters for the `osd_cat` command | --pos=bottom --offset=50 --align=center --indent=0 ( ... TL;DR ) |
| `osd-chain_wrap`      | integer | wrap OSD message at this value, 0 means no wrap   | 0                                                                |
| `osd-chain_rule`      | string  | currently defined rules, stringified              | ( nothing )                                                      |
{: .nowrap1}

## Versions

* 0.0 - ?
  * {: .added} Initial release.

* 0.1 - August 2008
  * {: .added} Added message wrapping at configurable width.
{: .changelog}

## Plans

* {: .pending} Replace with a pluggable version to support other notifications then OSD.
{: .todo}

## Download

{% include filelist.md %}
