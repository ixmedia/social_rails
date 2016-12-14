module IxSocial
  module Helpers

    module HelperMethods

      # Init a media
      def ixsocial media, options = {}
        method = "ixsocial_" + media.to_s
        if %w(facebook instagram).include?(media.to_s)
          media = "IxSocial::#{media.to_s.capitalize}".constantize
          media.set_public_options(options)
          render partial: 'ix_social/shared/placeholder', locals: {namespace: media.uid}
        end
      end

      def ixsocial_facebook
        IxSocial::Helpers::Facebook.new
      end
    end
  end
end
