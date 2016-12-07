require 'httparty'

module IxSocial

  # Instagram module for IxSocial
  class Instagram < Base

    # Module unique identifier
    self.uid = 'instagram'

    # Allows you to control options and set Instagram api requirements.
    # Required:
    #   * user_id
    #   * access_token
    # Options:
    #   * max_characters
    #   * cooldown
    #   * post_count
    self.required = %w(user_id access_token)

    # Query instagram api with HTTParty
    def self.get
      if self.configured?
        instagram_call = HTTParty.get("https://api.instagram.com/v1/users/#{self.config.user_id}/media/recent?count=1&access_token=#{self.config.access_token}")
        JSON.parse(instagram_call.body)['data'][0]
      end
    end

  end
end
