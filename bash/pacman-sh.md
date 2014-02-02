---
layout: page
title: pacman.sh
meta:
  description: Adds some frequently needed minor functionalities to pacman-g2.
  keywords: pacman, pacman-g2, wrapper, frugalware
date: 2013-11-17
tag: frugalware
status: [stable, active]
project: bash-script
directory: pacman
file:
  - pacman.sh: script
  - pacman.sh.1: man page
  - pacman.sh.pod: man page source
---

# pacman.sh - adds some frequently needed minor functionalities

`pacman-g2` does a lot of things. Sometimes it does too much. For example its
package searches always search in the descriptions too. Even when you want to
search only in the package names. So you have to filter the output to reduce the
result list to the desired packages only. pacman.sh is a wrapper which helps to
accomplish such simple tasks with fewer typing and typos.

## Usage

You can use pacman.sh as a standalone script or as a wrapper. In the later case
create an alias to it :

Bash code - create a wrapper
{: .precaption}

{% highlight bash %}
alias pacman=/path/to/pacman.sh
{% endhighlight %}

Operations implemented in the wrapper will be executed, other operations will be
passed forward to `pacman-g2`.

Warning !  
Although pacman.sh performs only read operations, is still better to <b>NOT</b>
use it when you have write access to the `pacman-g2` database. Avoid using it
as superuser. Create the alias to it only in your ~/.bashrc .
{: .warn .icon-warning}

sample output - `pacman.sh -W?`
{: .precaption .icon-screen}

{% commandline %}
usage:
  pacman.sh -Wu  regexp     - search for uninstalled package
  pacman.sh -Wsn regexp     - search for package name
  pacman.sh -Wqn regexp     - search for installed package name
  pacman.sh -Wun regexp     - search for uninstalled package name
  pacman.sh -Wc  package(s) - list changelog-like files
  pacman.sh -Wcv package(s) - view changelog-like files with $PAGER
  pacman.sh -Wx  package(s) - list executable files
  pacman.sh -Wxp package(s) - list executable files on $PATH
  pacman.sh -Wd  package(s) - list recursive dependencies
  pacman.sh -Wdt package(s) - tree recursive dependencies
  pacman.sh -Wox command(s) - print the owner of the commands on $PATH
  pacman.sh -Wh  package    - package operation history
  pacman.sh -Wn             - show some statistical number
  pacman.sh -Wv             - print wrapper version
  pacman.sh -W?             - print ( this ) wrapper help
{% endcommandline %}

## Configuration

No own configuration.

From the /etc/pacman-g2.conf configuration file uses some options for the `-Wh` ( `LogFile` ) and `-Wn` ( `HoldPkg`, `IgnorePkg`, `CacheDir`, `Server`, `DBPath`, `UpgradeDelay`, `OldDelay` ) operations.

## Versions

* 0.1 - September 2011
  * {: .added} Initial release.

* 0.2 - September 2011
  * {: .changed} Unified the wrapper command ( `-W` ).
  * {: .added} Search uninstalled package description and name ( `-Wu`, `-Wun` ).
  * {: .added} Search package history ( `-Wh` ).

* 0.3 - September 2011
  * {: .added} Print the owner of the commands on `$PATH` ( `-Wox` ).
  * {: .added} List package dependencies recursively ( `-Wd` ).
  * {: .added} Show some statistical number ( `-Wn` ).

* 0.4 - September 2011
  * {: .added} Tree package dependencies recursively ( `-Wdt` ).
{: .changelog}

## Plans

* {: .done} Arrange the recursive dependencies in a tree. ( Done in 0.4 -- see `-Wdt` option. )
* {: .pending} Add more statistical information.
* {: .pending} List summarized recursive dependencies.
{: .todo}

## Download

{% include filelist.md %}
