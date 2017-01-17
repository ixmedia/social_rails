module IxSocial
  module Helpers

    class Instagram < Base
      def initialize(template, content, scope, config)
        @tags = %w(picture caption)
        super
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
        locals[:caption] = truncate(caption)
        super(locals)
      end

      protected

      def caption
        @content["caption"]["text"]
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
