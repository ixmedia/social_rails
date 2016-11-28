require 'koala'

module IxSocial
  module Facebook
    
    extend Cache

    # Facebook module for IxSocial
    class << self

      attr_accessor :namespace

      def configure
        yield config
      end

      # Allows you to control options and set Koala::Facebook api requirements.
      # Required:
      #   * app_id
      #   * app_secret
      #   * page_name
      # Options:
      #   * max_characters
      #   * cooldown
      def config
        @config ||= OpenStruct.new(IxSocial::DEFAULT_CONFIG)
      end

    end

    # Use Koala to fetch Facebook feed
    def self.get
      oAuth   = Koala::Facebook::OAuth.new(self.config.app_id, self.config.app_secret)
      client  = Koala::Facebook::API.new(oAuth.get_app_access_token)

      feed = client.get_connection(self.config.page_name, 'posts', {fields: ['link', 'message'] })
      self.find_first_post(feed)
    end

    # @private
    # Loop through Facebook feed to find first message post
    def self.find_first_post feed
      feed.each do |item|
        return item if item.has_key?("message")
      end
      feed.next_page
    end

    self.namespace = 'ix_social/facebook'

  end
end
