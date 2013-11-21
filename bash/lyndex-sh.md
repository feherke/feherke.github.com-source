---
layout: page
title: lyndex.sh
meta:
  description: Create a word index from the Lynx traversal crawl files.
date: 2005-10-05
tag: search
project: Bash-script
directory: lyndex
file:
  - lyndex.sh: script
  - lyndex.ini: configuration
---

# lyndex.sh - Lynx-based site indexer

I was impressed by the [Lynx](http://lynx.isc.org/)'s crawling ability so much, that I write this indexer script to process it's result. Not much theory, just a glimpse
at the [CRAWL.announce](http://lynx.isc.org/release/lynx2-8-5/docs/CRAWL.announce) then a nice job of text processing. Fortunately Lynx does all the hard job, of
extracting URL and stripping the HTML tags, but sadly, some useful information is going away too. Like keywords and description `meta` tag values and the distinction of
heading elements. So this is just a simple solution, not a good one.

Currently my site is quite small, but the ratio says to me that is effective enough. Ok, I know, my English is poor and I use a limited amount of words, so is not a
big deal to index them. But I hope this ratio will worsen in time.

| Stage          | Files | Size   |
|----------------|------:|-------:|
| full site      | 62    | 594 Kb |
| crawled text   | 48    | 242 Kb |
| temporary data | 1     | 95 Kb  |
| resulted info  | 5     | 44 Kb  |

lyndex.sh spent only a few seconds on my site, but may work for long time. During the work it writes something about it's activity :

## Usage

lyndex.sh is expects no instructions directly. Usually there should be one configuration file for each site you want to index, then you just pass the configuration
file's name to work with :

sample output - `lyndex.sh --help`
{: .precaption .icon-screen}

{% commandline %}
Lyndex   version 1.0b   october 2005   written by Feherke
create a word index from the Lynx traversal crawl files

Syntax :
  lyndex.sh [inifile]

Parameter :
  inifile  - crawling settings file ( lyndex.ini )
{% endcommandline %}

lyndex.sh only builds some indexes then lets the user to do whatever he wants with them :

sample output - `lyndex.sh`
{: .precaption .icon-screen}

{% commandline %}
Lyndex   version 1.0b   october 2005   written by Feherke
Reading settings... Ok ( ./lyndex.ini )
Creating work directory... Ok ( lnkyLVdys )
Setting up restrictions... Ok ( 1 )
Composing user-agent... Ok ( Lyndex/1.0 Lynx/2.8.4rel.1 (Linux 2.4.19-4GB i686; console) )
Crawling http://rootshell/ ... Ok ( 234K )
Removing old data... Ok ( 5 files )
Generating checksums... Ok ( 44 entries )
Excluding duplicates... Ok ( 2 pieces )
Creating file list... Ok ( 42 files )
Extracting words... Ok ( 5252 entries )
Calculating maximum relevance... Ok ( 22 )
Parsing words... Ok ( 1351 words )
Creating table of contents... OK ( 26 letters )
Creating general file... OK ( 2 items )
Checking for spelling errors... OK ( 268 occurences )
Removing temporary data... Ok ( 322K )
Removing work directory... Ok ( lnkyLVdys )
Done ( 10 seconds )
{% endcommandline %}

## Configuration

The configuration file

* is mandatory
* can be specified in command line
* by default is located in the same directory with the script
* by default has the same name with the script, with _.sh_ extension removed and _.ini_ extension added
* is sourceable shell script

lyndex.ini - sample configuration
{: .precaption .icon-file-config}

{% highlight ini %}
# Lyndex   version 1.0b   october 2005   written by Feherke
# create a word index from the Lynx traversal crawl files
# settings file

# base url and starting point for crawl from
# should be the highest level directory from the structure
starturl="http://example.com/"

# minimum word length
# words with less then this many characters will be excluded
minword=3

# maximum ASCII-art length
# words containing one character more then this many time will be excluded
maxaart=3

# maximum percent of pages, including a relevant word
# if more then this many pages contains it, the word is not relevant
# the word could be irrelevant only if all pages contain it in same count
maxrele=90

# decrement almost irrelevant word scoring
# for the words above relevance limit, but with different count per page
# the count could be
decirel="yes"

# size of page sample in characters
# will be displayed in the page list
sample=250

# directory to exclude from crawling
# more then one directories can be specified in an array :
# nocrawl=( "http://example.com/sample/" "http://example.com/temp/" )
nocrawl="http://example.com/private/"

# checksum calculation tool
# used to detect multiple instances of a page
# some possible values :
#   cksum | md5sum | sha1sum | sum
#   du -b | wc -c
checksum="md5sum"

# spelling verification tool
# if specified, will be used to check the word list
# some possible values :
#   ispell -a | aspell -a
shellcheck="ispell -a"
{% endhighlight %}

## Versions

* 1.0 - September 2005
  * {: .added} Initial release.

* 1.0b - October 2005
  * {: .changed} Exclude duplications when more URLs are pointing to the same content.
  * {: .added} Exclude too short words ( option `minword` ).
  * {: .added} Poor ASCII art recognition by watching characters repeated multiple times ( option `maxaart` ).
  * {: .added} Spell checking ( option `spellcheck` ).
{: .changelog}

## Plans

* {: .pending} Documentation.
{: .todo}

## Download

{% include filelist.md %}

{% include abbreviation.md %}
