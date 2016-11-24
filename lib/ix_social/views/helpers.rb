module IxSocial
  module View
    module Helpers
      
      def ix_social_facebook
        render partial: IxSocial::Facebook.namespace, locals: {post: facebook}
      end

      def ix_social_facebook_message scope
        scope["message"]
      end

      def ix_social_facebook_link scope
        scope["link"]
      end

      def ix_social_instagram
        render partial: IxSocial::Instagram.namespace, locals: {post: instagram}
      end

    end
  end
end
