require 'koala'

module IxSocial

  # Facebook module for IxSocial
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
      feed.each do |item|
        items.push(item) if item.has_key?("message")
        return items if items.count == self.config.public[:post_count]
      end
      feed.next_page
    end

  end


end
