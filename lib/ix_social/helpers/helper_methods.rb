require 'ix_social/apis'

module IxSocial
  module Helpers

    module HelperMethods

      ##
      # What starts it all.
      # Render a placeholder with a namespace.
      # To use in an view.
      # Ex.: <%= ixsocial(:facebook [, {options}]) %>
      #
      # @param {Symbol} Must be one of these: `::APIS`
      # @param {Hash} (Optional)
      #
      def ixsocial api, options = {}
        if valid_media(api)
          api = "IxSocial::API::#{api.to_s.capitalize}".constantize
          api.set_public_options(options)
          render partial: 'ix_social/shared/placeholder', locals: {namespace: api.uid}
        end
      end

      ##
      # Build [api]_posts methods
      # To use in a async rendered view
      # Ex.: `facebook_posts.each do |post|`
      #
      IxSocial::APIs.each do |api|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{api}_posts
            posts, the_content = [], content

            if !the_content.nil?
              config = "IxSocial::API::#{api.to_s.capitalize}".constantize.config
              for i in 0..config.public[:post_count] - 1
                posts.push("IxSocial::Helpers::#{api.to_s.capitalize}".constantize.new(
                  self,
                  the_content[i],
                  IxSocial::API::#{api.to_s.capitalize}.uid,
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
        IxSocial::APIs.include?(api.to_s)
      end
    end
  end
end
