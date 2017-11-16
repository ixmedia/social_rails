module SocialRails
  module Helpers

    class Facebook < Base
      def initialize(template, content, scope, config)
        @tags = %w(full_picture description)
        super
      end
    end

    module FacebookPostPart
      def to_s(locals = {})
        locals[:link]     = @content["link"]
        locals[:message]  = truncate @content["message"]
        super(locals)
      end
    end

    class FullPicture < Tag
      include FacebookPostPart
      def to_s(locals = {})
        locals[:has_full_picture] = @content["full_picture"] && !@content["full_picture"].empty?
        locals[:full_picture] = @content["full_picture"]
        super(locals)
      end
    end

    class Description < Tag
      include FacebookPostPart
    end
  end
end
