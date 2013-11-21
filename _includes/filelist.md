You can find the related files on GitHub in my [{{ page.project }} repository]({{ site.github }}/{{ page.project }})'s [{{ page.directory }} directory]({{ site.github }}/{{ page.project }}/blob/master/{{ page.directory }}/) :
{: .icon-directory}
{% for one in page.file %}
* {% capture extension %}{{ one | hashx: 'key' | first | split: '.' | last }}{% endcapture %}{: .icon-file-{% if site.filetype[extension] %}{{ site.filetype[extension] }}{% else %}unknown{% endif %}} [{{ one | hashx: 'key' | first | replace: '_','\_' }}]({{ site.github }}/{{ page.project }}/blob/master/{{ page.directory }}/{{ one | hashx: 'key' }}) - {{ one | hashx: 'value' }}{% endfor %}
{: .download}
