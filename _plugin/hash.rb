# Hash Access Filter   version 0.0   october 2011   written by Feherke
# Returns various parts of the input, supposing it is a Hash.
#
# Syntax :
#   {{ meta | hashx }}
#     Returns an Array linearized from the Hash. ( See Hash#flatten . )
#   {{ meta | hashx: 'key' }}
#     Returns an Array of Hash keys. ( See Hash#keys . )
#   {{ meta | hashx: 'value' }}
#     Returns an Array of Hash values. ( See Hash#values . )
#   {{ meta | hashx: 'entry' }}
#     Returns an Array of Hash entries. ( See Hash#entries . )
#
# Note that the input is returned unaltered if it is not a Hash.
#
# Sample input :
#   data:
#     a: b
#     c: d
#
# Sample code :
#   {{ data | hashx: 'key' }}
#
# Sample output :
#   ac

module Jekyll

  module HashFilter

    def hashx input, part='flatten'

      return input unless input.instance_of? Hash

      case part
        when 'key' then input.keys
        when 'value' then input.values
        when 'entry' then input.entries
        else input.flatten
      end
    end

  end

end

Liquid::Template.register_filter Jekyll::HashFilter
