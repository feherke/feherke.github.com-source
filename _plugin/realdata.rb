# Real Data Generator   version 0.1   december 2013   written by Feherke
# Collects real site data from the source files.
#
# Syntax :
#   {% realcrumb %}
#     Returns bread crumb path Markdown for the current page.
#   {% reallist %}
#     Returns file list Markdown for the current directory.
#   {{ site.realtagcloud }}
#     Returns a tag cloud Markdown for the site.
#   {{ site.realstatuslist }}
#     Returns a status list Markdown for the site.
#   {{ site.realmenu }}
#     Returns a category menu Markdown for the site.
#
# Currently the generator is used only to perform the data collecting before the
# proper processing is done. The collect data are preformatted and added to the
# site object to spare later processing.
#
# Sample input:
#   ---
#   title: something
#   meta:
#     description: some words about some thing
#   date: 2012-02-07
#   tag:
#     - whatever
#   ---
#
# Sample code:
#   {% realcrumb %}
#
# Sample output:
#   [main page](/) / [something](/path/) /
#
# Sample code:
#   {% reallist %}
#
# Sample output:
#   [something](/path/file.html)
#   : 2012-02-07 / [whatever](/tag.html#whatever)
#   : some words about some thing
#
# Sample code:
#   {{ site.realtagcloud }}
#
# Sample output:
#   [whatever](/tag.html#whatever "1"){: style="font-size: 8pt"}
#
# Sample code:
#   {{ site.realmenu }}
#
# Sample output:
#   * [something](/path/)

require 'yaml'

module Jekyll

  class RealDataGenerator < Generator
    safe true

    MIN_CLOUD_FONT_SIZE = 8
    MAX_CLOUD_FONT_SIZE = 18

    def generate site

      real = {}
      Dir[site.source + '/**/*'].each do |one|
        next unless File.file? one

        rel = one[site.source.length + 1 .. -1]
        next if rel.split('/').index { |o| o[0] == '_' }

        path, name = File.split rel
        path = '' if path == '.'
        ext = File.extname name
        name[-ext.length .. -1] = ''

        yaml = nil
        begin
          yaml = YAML.load_file one
        rescue
          next
        end
        next unless yaml.instance_of? Hash
        next unless yaml.include? 'title'

        tag = yaml['tag']
        tag = tag.to_s.split(/\s+/) unless tag.instance_of? Array

        status = yaml['status']
        status = status.to_s.split(/\s+/) unless status.instance_of? Array

        desc = (yaml['meta'].instance_of? Hash and yaml['meta'].include? 'description') ? yaml['meta']['description'] : ''

        real[rel] = { 'title' => yaml['title'], 'desc' => desc, 'date' => yaml['date'], 'tag' => tag, 'status' => status, 'path' => path, 'name' => name, 'ext' => ext }
      end

      menu = ''
      real.select { |k, v| v['path'] != '' and v['name'] == 'index' }.sort_by { |k, v| v['path'] }.each do |o|
        nr=real.count { |k, v| v['path'] == o[1]['path'] and v['name'] != 'index' }
        menu << "#{ ' ' * o[1]['path'].count('/') * 4 }* [#{ o[1]['title'] }](/#{ o[1]['path'] }/ \"#{ nr } script#{ nr>1 ? 's' : '' }\")\n"
      end

      tag = {}
      real.each_pair do |page, prop|
        next if prop['tag'].empty?
        prop['tag'].each { |o| if tag.include?(o) then tag[o] << page else tag[o] = [page] end }
      end

      status = {}
      real.each_pair do |page, prop|
        next if ! prop.key? 'status' || prop['status'].empty?
        prop['status'].each { |o| if status.include?(o) then status[o] << page else status[o] = [page] end }
      end

      temp = {}
      tag.keys.sort { |a,b| a.downcase <=> b.downcase }.each { |o| temp[o] = tag[o] }
      tag = temp

      max = tag.reduce(0) { |sum, o| sum > o[1].length ? sum : o[1].length }
      min = tag.reduce(max) { |sum, o| sum < o[1].length ? sum : o[1].length }

      cloud = ''
      tag.each do |one|
        font = ((one[1].length - min) / (max - (min == max ? 0 : min))) * (MAX_CLOUD_FONT_SIZE - MIN_CLOUD_FONT_SIZE) + MIN_CLOUD_FONT_SIZE

        cloud << "[#{ one[0] }](/tag.html##{ one[0] } \"#{ one[1].length } script#{ one[1].length>1 ? 's' : '' }\"){: style=\"font-size: #{ font.to_i }pt\"}\n"
      end

      list = ''
      status.each do |one|
        list << "[#{ one[0] }](/status.html##{ one[0] } \"#{ one[1].length } script#{ one[1].length>1 ? 's' : '' }\")\n"
      end

# raw data
      site.config['real'] = real
      site.config['realtag'] = tag
      site.config['realstatus'] = status
# preformatted data
      site.config['realmenu'] = menu
      site.config['realtagcloud'] = cloud
      site.config['realstatuslist'] = list

    end

  end

  class RealListTag < Liquid::Tag

    def render context
      site = context.registers[:site]
      page = context.environments.first['page']

      # result = "| Title | Description | Modified |\n|-|-|-|\n" # table
      result = ''
      dir = File.dirname page['url'][1..-1]
      site.config['real'].select { |k, v| v['path'] == dir and v['name'] != 'index' }.sort_by { |k, v| v['title'] }.each do |one|
        # result << "| #{ one[1]['title'] } | #{ one[1]['desc'] } | #{ one[1]['date'] } |\n" # table
        tag = one[1]['tag'].empty? ? '' : '/ ' + one[1]['tag'].map { |o| "[#{ o }](/tag.html##{ o } \"#{ nr = site.config['realtag'][o].length } script#{ nr > 1 ? 's' : '' }\")" }.join(', ')
        status = one[1]['status'].empty? ? '' : '/ ' + one[1]['status'].map { |o| "[#{ o }](/status.html##{ o } \"#{ nr = site.config['realstatus'][o].length } script#{ nr > 1 ? 's' : '' }\")" }.join(', ')
        result << "[#{ one[1]['title'] }](#{ one[1]['name'] }.html)\n"
        result << ": #{ one[1]['date'] } #{ tag } #{ status }\n"
        result << ": #{ one[1]['desc'].to_s.empty? ? '-' : one[1]['desc'] }\n"
        result << "\n"
      end

      result
    end

  end

  class RealCrumbTag < Liquid::Tag

    def render context
      site = context.registers[:site]
      page = context.environments.first['page']
      dir = File.dirname(page['url'])

      path = ''
      crumb = ''
      dir.split('/').each do |one|
        path << one
        page = site.config['real'].select { |k, v| v['path'] == path and v['name'] == 'index' }.shift
        path << '/' unless path.empty?
        unless page.empty?
          crumb << "[#{ page[1]['title'] }](/#{ path }) / "
        end
      end

      crumb
    end

  end

end

Liquid::Template.register_tag 'reallist', Jekyll::RealListTag
Liquid::Template.register_tag 'realcrumb', Jekyll::RealCrumbTag
