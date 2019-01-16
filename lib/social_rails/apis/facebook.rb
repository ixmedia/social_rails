require 'koala'

module SocialRails

  module API

    # Facebook module for SocialRails
    class Facebook < Base

      # Module unique identifier
      self.uid = 'facebook'

      # Facebook Graph Api requirements
      # Required:
      #   * app_id
      #   * app_secret
      #   * page_name
      self.required = %w(app_id app_secret page_name)

      # @private
      # Use Koala to fetch Facebook feed
      def self.get
        oAuth   = Koala::Facebook::OAuth.new(self.config.app_id, self.config.app_secret)
        client  = Koala::Facebook::API.new(oAuth.get_app_access_token)

        feed = client.get_connection(self.config.page_name, 'posts', {fields: ['link', 'message', 'full_picture'] })
        self.find_posts(feed)
      end

      # Loop through Facebook feed to find posts with message
      def self.find_posts feed
        items = []
        while items.count < self.config.public[:post_count] || feed.size == 0
          feed.each do |item|
            next unless item.has_key?("message")
            next unless lang_is_detected?(item["message"])

            items.push(item)
            return items if items.count == self.config.public[:post_count]
          end
          feed = feed.next_page
        end
        return items
      end

    end
  end
end
