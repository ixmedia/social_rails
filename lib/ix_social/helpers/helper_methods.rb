module IxSocial
  module Helpers

    module HelperMethods

      # Init a media
      def ixsocial media, options = {}
        method = "ixsocial_" + media.to_s

        if valid_media(media)
          media = "IxSocial::#{media.to_s.capitalize}".constantize
          media.set_public_options(options)
          render partial: 'ix_social/shared/placeholder', locals: {namespace: media.uid}
        end
      end

      def ixsocial_posts media
        posts, the_content = [], content

        if valid_media(media) && !the_content.nil?
          config = "IxSocial::#{media.to_s.capitalize}".constantize.config
          for i in 0..config.public[:post_count] - 1
            posts.push("IxSocial::Helpers::#{media.to_s.capitalize}".constantize.new(
              self,
              the_content[i],
              config
            ))
          end
        end
        posts
      end

      protected

      def valid_media(media)
        # TODO : store medias array in BASE::var maybe? call me maybe
        %w(facebook instagram).include?(media.to_s)
      end
    end
  end
end
