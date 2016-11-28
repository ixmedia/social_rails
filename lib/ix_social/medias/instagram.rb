require 'httparty'

module IxSocial
  module Instagram

    extend Cache

    # Instagram module for IxSocial
    class << self

      attr_accessor :namespace

      def configure
        yield config
      end

      # Allows you to control options and set Instagram api requirements.
      # Required:
      #   * user_id
      #   * access_token
      # Options:
      #   * max_characters
      #   * cooldown
      #   * post_count
      def config
        @config ||= OpenStruct.new(IxSocial::DEFAULT_CONFIG)
      end

    end

    def self.get
      instagram_call = HTTParty.get("https://api.instagram.com/v1/users/#{self.config.user_id}/media/recent?count=1&access_token=#{self.config.access_token}")
      JSON.parse(instagram_call.body)['data'][0]
    end

    self.namespace = 'ix_social/instagram'

  end
end
