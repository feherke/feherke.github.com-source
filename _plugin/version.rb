# Version Tag   version 0.3   November 2013   written by Feherke
# Liquid tag to return various version numbers.
#
# Syntax :
#   {% version what %}
#     Returns the current version of the named thing. what can be :
#       albino - Albino highlighter's version ( See Albino::VERSION . )
#       jekyll - Jekyll engine's version ( See Jekyll::VERSION . )
#       kramdown - kramdown converter's version ( See Kramdown::VERSION . )
#       liquid - Liquid template's version
#       maruku - Maruku converter's version ( See MaRuKu::Version . )
#       pygments - Pygments highlighter's version ( See Pygments::VERSION . )
#       ruby - Ruby interpreter's version ( See RUBY_VERSION . )
#
# Sample code :
#   {% version ruby %}
#
# Sample output :
#   1.9.2

require 'pygments'

module Jekyll

  class VersionTag < Liquid::Tag

    def initialize tag_name, markup, token
      @what = markup.strip.downcase.delete '"\''

    end

    def render context

      case @what
        when 'albino' then Albino::VERSION
        when 'jekyll' then Jekyll::VERSION
        when 'kramdown' then Kramdown::VERSION
        when 'liquid' then Gem.loaded_specs['liquid'].version.version
        when 'maruku' then MaRuKu::Version
        when 'pygments' then Gem.loaded_specs['pygments.rb'].version.version
        when 'ruby' then RUBY_VERSION
        else ''
      end rescue '-'
    end

  end

end

Liquid::Template.register_tag 'version', Jekyll::VersionTag
