module IxSocial
  module Helpers

    class Instagram < Base
      %w[picture caption].each do |tag|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{tag}_tag
            #{tag.classify}.new @template, @content, IxSocial::Instagram.uid, @config
          end
        DEF
      end
    end

    module InstagramPostPart
      def to_s(locals = {})
        locals[:link] = @content["link"]
        super(locals)
      end
    end

    class Caption < Tag
      include InstagramPostPart

      def to_s(locals = {})
        locals[:caption] = @content["caption"]["text"]
        super(locals)
      end
    end

    class Picture < Tag
      include InstagramPostPart

      def to_s(locals = {})
        locals[:picture] = @content["images"]["standard_resolution"]["url"]
        super(locals)
      end
    end
  end
end
