require 'social_rails/apis'

module SocialRails
  module Helpers

    module HelperMethods

      ##
      # What starts it all.
      # Render a placeholder with a namespace.
      # To use in an view.
      # Ex.: <%= socialrails(:facebook [, {options}]) %>
      #
      # @param {Symbol} Must be one of these: `SocialRails::APIs`
      # @param {Hash} (Optional)
      #
      def socialrails api, options = {}
        if valid_media(api)
          api = "SocialRails::API::#{api.to_s.capitalize}".constantize
          api.set_public_options(options)
          render partial: 'social_rails/shared/placeholder', locals: {namespace: api.uid}
        end
      end

      ##
      # Build [api]_posts methods
      # To use in a async rendered view
      # Ex.: `facebook_posts.each do |post|`
      #
      SocialRails::APIs.each do |api|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{api}_posts
            posts, the_content = [], "SocialRails::API::#{api.to_s.capitalize}".constantize.latest

            if !the_content.nil?
              config = "SocialRails::API::#{api.to_s.capitalize}".constantize.config
              for i in 0..config.public[:post_count] - 1
                posts.push("SocialRails::Helpers::#{api.to_s.capitalize}".constantize.new(
                  self,
                  the_content[i],
                  SocialRails::API::#{api.to_s.capitalize}.uid,
                  config
                ))
              end
            end
            posts
          end
        DEF
      end

      protected

      def valid_media(api)
        SocialRails::APIs.include?(api.to_s)
      end
    end
  end
end
