module IxSocial
  module ActionView
    module FacebookHelpers

      def ix_social_facebook
        render partial: IxSocial::Facebook.namespace
      end

      def ix_social_facebook_message scope
        scope["message"]
      end

      def ix_social_facebook_link scope
        scope["link"]
      end

    end
  end
end
