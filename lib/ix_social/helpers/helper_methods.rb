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

      %w(facebook instagram twitter).each do |media|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{media}_posts
            posts, the_content = [], content

            if !the_content.nil?
              config = "IxSocial::#{media.to_s.capitalize}".constantize.config
              for i in 0..config.public[:post_count] - 1
                posts.push("IxSocial::Helpers::#{media.to_s.capitalize}".constantize.new(
                  self,
                  the_content[i],
                  IxSocial::#{media.to_s.capitalize}.uid,
                  config
                ))
              end
            end
            posts
          end
        DEF
      end

      protected

      def valid_media(media)
        # TODO : store medias array in BASE::var maybe? call me maybe
        %w(facebook instagram twitter).include?(media.to_s)
      end
    end
  end
end
