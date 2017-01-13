module IxSocial
  module Helpers

    class Facebook < Base
      %w[full_picture description].each do |tag|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{tag}_tag
            #{tag.classify}.new @template, @content, 'facebook', @config
          end
        DEF
      end
    end

    module FacebookPostPart
      def to_s(locals = {})
        locals[:link] = @content["link"]
        locals[:message] = @content["message"]
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
