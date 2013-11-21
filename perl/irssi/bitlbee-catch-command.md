---
layout: page
title: BitlBee - Catch Command
meta:
  description: Catch BitlBee commands sent accidentally to other channels.
date: 2012-02-24
tag: BitlBee
project: Irssi-script
directory: bitlbee-catch-command
file:
  - bitlbee-catch-command.pl: script
---

# BitlBee - Catch Command

Sometimes I type messages in the wrong window. As I am not gossiping, those are not specifically embarrassing. However BitlBee commands may contain snippets of private
information, which should not be made public.

This script save such situations by stopping messages which looks like BitlBee commands and asks for confirmation. The confirmation is simple : <kbd>up arrow</kbd> and
<kbd>Enter</kbd>. I mean, if the message is repeated between a given amount of time, it is let to pass.

## Usage

This script is not interactive, so it defines no command.

To get some information use the `/help bb-catch` command.

## Configuration

Use the `/set` command to configure this script. The settings are queried when using them, so changes will be visible automatically on next use.

| Setting                        | Type    | Description                                | Default                         |
|--------------------------------|---------|--------------------------------------------|---------------------------------|
| `bitlbee-catchcommand_active`  | boolean | turns the command catching on and off      | true                            |
| `bitlbee-catchcommand_timeout` | integer | time to wait for confirmation, in seconds  | 3                               |
| `bitlbee-catchcommand_command` | string  | space separated list of commands to catch  | account add allow ( ... TL;DR ) |
| `bitlbee-catchcommand_channel` | string  | space separated list of channels to ignore | &bitlbee                        |
{: .nowrap1}

## Versions

* 0.0 - ?
  * {: .added} Initial release.

* 0.1 - March 2008
  * {: .changed} Updated BitlBee command list.

* 0.2 - February 2012
  * {: .added} Added setting to enumerate commands to catch.
  * {: .added} Added setting to enumerate channels to ignore.
{: .changelog}

## Plans

* {: .pending} Think to an exception list. Is annoying when all help commands sent in private message to a bot are caught.
{: .todo}

## Download

{% include filelist.md %}
