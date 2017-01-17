module IxSocial
  module Helpers

    class Twitter < Base
      %w[tweet].each do |tag|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{tag}_tag
            #{tag.classify}.new @template, @content, 'twitter', @config
          end
        DEF
      end
    end

    class Tweet < Tag

      def to_s(locals = {})
        locals[:tweet] = @content["html"]
        super(locals)
      end
    end

  end
end
