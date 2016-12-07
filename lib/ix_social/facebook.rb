require 'koala'

module IxSocial

  # Facebook module for IxSocial
  class Facebook < Base

    # Module unique identifier
    self.uid = 'facebook'

    # Required:
    #   * app_id
    #   * app_secret
    #   * page_name
    # Options:
    #   * max_characters
    #   * cooldown
    self.required = %w(app_id app_secret page_name)

    # Use Koala to fetch Facebook feed
    def self.get
      if self.configured?
        oAuth   = Koala::Facebook::OAuth.new(self.config.app_id, self.config.app_secret)
        client  = Koala::Facebook::API.new(oAuth.get_app_access_token)

        feed = client.get_connection(self.config.page_name, 'posts', {fields: ['link', 'message'] })
        self.find_first_post(feed)
      end
    end

    # @private
    # Loop through Facebook feed to find first message post
    def self.find_first_post feed
      feed.each do |item|
        return item if item.has_key?("message")
      end
      feed.next_page
    end
  end
end
