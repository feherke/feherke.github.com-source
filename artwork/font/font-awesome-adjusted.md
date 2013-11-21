---
layout: page
title: Font Awesome Adjusted
meta:
  description: Font Awesome icon font adjusted to my site's needs.
date: 2013-02-04
tag: font
bstyle: |
  ul.sample {
    list-style-type: none;
    margin-left: 5px;
  }
  ul.sample li::before {
    font-size: 90%;
    font-weight: bold;
    vertical-align: middle;
    padding-left: .5em;
    padding-right: .5em;
    margin-right: .5em;
  }
  ul.sample.with li::before {
    font-family: FontAwesomeAdjusted;
  }
  ul.sample li.added::before {
    content: "(+)";
    color: #0f0;
  }
  ul.sample li.removed::before {
    content: "(-)";
    color: #f00;
  }
  .precaption+ul {
    background-color: black;
    border-style: solid;
    border-color: #336;
    border-width: 1px;
    padding: 3px;
    margin-bottom: 15px;
  }
project: Font-file
directory: font-awesome-adjusted
file:
  - fontawesomeadjusted.sdf: font source
  - fontawesomeadjusted.ttf: truetype font
  - fontawesomeadjusted.woff: web openfont
  - fontawesomeadjusted.svg: SVG font
---

# Font Awesome Adjusted

Well, that is all. An adjusted version of [Font Awesome](http://fortawesome.github.com/Font-Awesome/).

Warning  
Hell knows what happened to the icons. Suddenly all glyphs' rounding changed transforming the circles into octagons. I corrected them using version 3.0.2 icons and now
some have blurry edges. No idea whether I will ever fix them or not.
{: .warn .icon-warning}

I found my site abit naked, so I decided to add some icons. As I used no images for decorations I decided to use an icon font instead of images. I wished to find a font
with both navigational and file type icons. No such font exists, so I choose Font Awesome and adjusted it to my needs :

* Copied glyphs resembling regular characters over their regular correspondent to ensure fallback in case the icon font not gets loaded.
* Copied glyphs I needed in smaller groups by categories in additional location in the private area.
* Adjusted some glyphs I found to look too blurry on my dark pages.
* Drawn some file type icons I needed based on the file icon.

After all, I could draw all glyphs of my own icon font, but I can not start it from zero anyway : I am unable to set up all those properties of the font which contribute
to their pleasant appearance regardless of scaling.

## Usage

<table>
<tr><th>Code</th><th>Name</th><th>Original</th><th>Awesome</th><th>Comment</th></tr>
<tr><td>0021</td><td>exclamation mark    </td><td>!</td><td class="iconfont">!</td><td>adjusted</td></tr>
<tr><td>0028</td><td>left parenthesis    </td><td>(</td><td class="iconfont">(</td><td>by Fehérke</td></tr>
<tr><td>0029</td><td>right parenthesis   </td><td>)</td><td class="iconfont">)</td><td>by Fehérke</td></tr>
<tr><td>002a</td><td>asterisk            </td><td>*</td><td class="iconfont">*</td><td>adjusted</td></tr>
<tr><td>002b</td><td>plus sign           </td><td>+</td><td class="iconfont">+</td><td>adjusted</td></tr>
<tr><td>002d</td><td>hyphen-minus        </td><td>-</td><td class="iconfont">-</td><td>adjusted</td></tr>
<tr><td>003f</td><td>question mark       </td><td>?</td><td class="iconfont">?</td><td>adjusted</td></tr>
<tr><td>0069</td><td>latin small letter i</td><td>i</td><td class="iconfont">i</td><td>adjusted</td></tr>

<tr><td>231a</td><td>watch               </td><td>&#x231a;</td><td class="iconfont">&#x231a;</td><td>-</td></tr>
<tr><td>26a0</td><td>warning sign        </td><td>&#x26a0;</td><td class="iconfont">&#x26a0;</td><td>adjusted</td></tr>
<tr><td>2713</td><td>check mark          </td><td>&#x2713;</td><td class="iconfont">&#x2713;</td><td>adjusted</td></tr>
<tr><td>2717</td><td>ballot x            </td><td>&#x2717;</td><td class="iconfont">&#x2717;</td><td>adjusted</td></tr>

<tr><td>f200</td><td>home                </td><td rowspan="30">private use area</td><td class="iconfont">&#xf200;</td><td>-</td></tr>
<tr><td>f201</td><td>sitemap             </td><td class="iconfont">&#xf201;</td><td>-</td></tr>
<tr><td>f202</td><td>feed                </td><td class="iconfont">&#xf202;</td><td>-</td></tr>

<tr><td>f210</td><td>usage               </td><td class="iconfont">&#xf210;</td><td>-</td></tr>
<tr><td>f211</td><td>configuration       </td><td class="iconfont">&#xf211;</td><td>-</td></tr>
<tr><td>f212</td><td>version             </td><td class="iconfont">&#xf212;</td><td>-</td></tr>
<tr><td>f213</td><td>plan                </td><td class="iconfont">&#xf213;</td><td>-</td></tr>
<tr><td>f214</td><td>download            </td><td class="iconfont">&#xf214;</td><td>-</td></tr>
<tr><td>f215</td><td>legal               </td><td class="iconfont">&#xf215;</td><td>-</td></tr>

<tr><td>f220</td><td>link                </td><td class="iconfont">&#xf220;</td><td>-</td></tr>
<tr><td>f221</td><td>tag                 </td><td class="iconfont">&#xf221;</td><td>-</td></tr>
<tr><td>f222</td><td>search              </td><td class="iconfont">&#xf222;</td><td>-</td></tr>
<tr><td>f223</td><td>screen              </td><td class="iconfont">&#xf223;</td><td>-</td></tr>
<tr><td>f224</td><td>screenshot          </td><td class="iconfont">&#xf224;</td><td>-</td></tr>
<tr><td>f225</td><td>cookie              </td><td class="iconfont">&#xf225;</td><td>by Fehérke</td></tr>

<tr><td>f230</td><td>github              </td><td class="iconfont">&#xf230;</td><td>-</td></tr>
<tr><td>f231</td><td>html5               </td><td class="iconfont">&#xf231;</td><td>by Fehérke</td></tr>
<tr><td>f232</td><td>css3                </td><td class="iconfont">&#xf232;</td><td>by Fehérke</td></tr>

<tr><td>f240</td><td>directory           </td><td class="iconfont">&#xf240;</td><td>-</td></tr>
<tr><td>f241</td><td>file                </td><td class="iconfont">&#xf241;</td><td>by Fehérke</td></tr>
<tr><td>f242</td><td>file unknown        </td><td class="iconfont">&#xf242;</td><td>by Fehérke</td></tr>
<tr><td>f243</td><td>file text           </td><td class="iconfont">&#xf243;</td><td>by Fehérke</td></tr>
<tr><td>f244</td><td>file binary         </td><td class="iconfont">&#xf244;</td><td>by Fehérke</td></tr>
<tr><td>f245</td><td>file script         </td><td class="iconfont">&#xf245;</td><td>by Fehérke</td></tr>
<tr><td>f246</td><td>file embed          </td><td class="iconfont">&#xf246;</td><td>by Fehérke</td></tr>
<tr><td>f247</td><td>file html           </td><td class="iconfont">&#xf247;</td><td>by Fehérke</td></tr>
<tr><td>f248</td><td>file css            </td><td class="iconfont">&#xf248;</td><td>by Fehérke</td></tr>
<tr><td>f249</td><td>file config         </td><td class="iconfont">&#xf249;</td><td>by Fehérke</td></tr>
<tr><td>f24a</td><td>file man            </td><td class="iconfont">&#xf24a;</td><td>by Fehérke</td></tr>
<tr><td>f24b</td><td>file pod            </td><td class="iconfont">&#xf24b;</td><td>by Fehérke</td></tr>
</table>

The parenthesis are used for fallback : they are used literally, but if Font Awesome Adjusted is in use, they disappear.

sample rendering **without** Font Awesome Adjusted
{: .precaption}

* {: .added} Added icon.
* {: .removed} Removed icon.
{: .sample}

sample rendering **with** Font Awesome Adjusted
{: .precaption}

* {: .added} Added icon.
* {: .removed} Removed icon.
{: .sample .with}

## Configuration

None.

Well, fonts can not really be configured, but a suitable _font editor configuration_ could help.

## Versions

* 0.0 - February 2013
  * {: .added} Initial release.
{: .changelog}

## Plans

* {: .pending} Draw some type specific file icons for script, HTML, CSS, binary, etc.
* {: .pending} Draw or acquire some technology specific icons for Ruby, Jekyll, Markdown, etc.
* {: .pending} Draw or acquire HTML5, CSS3, eventually WAI.
* {: .pending} Design better section icons for usage, versions and plans.
* {: .pending} Design an icon for breadcrumb.
{: .todo}

## Download

{% include filelist.md %}

## Legal

The copyright of the original Font Awesome is owned by Dave Gandy. Visit [fortawesome.github.com/Font-Awesome](http://fortawesome.github.com/Font-Awesome) for more
copyright information.

Font Awesome Adjusted contains the entire original Font Awesome unaltered. All glyphs I adjusted were copied to a different character.

I hope the chosen name makes it clear that the essential part of the work was made by the original font's author.
