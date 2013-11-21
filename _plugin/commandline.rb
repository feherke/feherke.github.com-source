# Command Line Block   version 0.0   january 2012   written by Feherke
# Liquid tag to highlight command prompt in command line sample.
#
# Syntax :
#   {% commandline [prompt] %}
#     Highlights the specified prompt in the block's content.
#
# The prompt parameter is a regular expression ( See Regexp . )
# It has to capture the prompt to highlight as group 1.
# When missing, defaults to the default Bash prompt strings.
#
# Sample input :
#   none
# Sample code :
#   {% commandline %}
#   bash-4.2$ echo 'hello
#   > world'
#   hello
#   world
#   {% endcommandline %}
# Sample output :
#   <span class="ps">bash-4.2$</span> echo 'hello
#   <span class="ps">&gt;</span> world'
#   hello
#   world

module Jekyll

  class CommandLineBlock < Liquid::Block
    Prompt = /^(bash-\d+\.\d+[$#] |> |#\? |\+ )/

    def initialize tag_name, markup, tokens

      @prompt = Prompt

      unless markup.empty?
        begin
          @prompt = Regexp.new markup, Regexp::MULTILINE
        rescue RegexpError => e
          puts "CommandLineBlock : invalid Regexp for the prompt ( #{ e.message } )"
        end
      end

      super
    end

    def render context
      content = super

      content.gsub! @prompt, '<span class="pr">\1</span>'

      "<pre><samp class=\"cli\"\n>#{ content.lstrip }</samp></pre>\n"
    end
  end

end

Liquid::Template.register_tag 'commandline', Jekyll::CommandLineBlock
