require 'twitter'

module SocialRails

  module API
    # Twitter module for SocialRails
    class Twitter < Base

      # Module unique identifier
      self.uid = 'twitter'

      # Twitter api requirements.
      # Required:
      #   * consumer_key
      #   * consumer_secret
      #   * access_token
      #   * access_token_secret
      self.required = %w(consumer_key consumer_secret access_token access_token_secret)

      # @private
      # Query twitter api with Twitter gem
      def self.get
        client = ::Twitter::REST::Client.new({
          consumer_key: self.config.consumer_key,
          consumer_secret: self.config.consumer_secret,
          access_token: self.config.access_token,
          access_token_secret: self.config.access_token_secret
        })

        latest_tweets = client.user_timeline(self.config.twitter_name, { exclude_replies: true, include_rts: false }).first(self.config.public[:post_count])
        tweets        = latest_tweets.map{ |t| client.oembed(t.id, {lang: 'fr'}) }
      end

    end
  end
end
