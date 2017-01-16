require 'httparty'

module IxSocial

  # Instagram module for IxSocial
  class Instagram < Base

    # Module unique identifier
    self.uid = 'instagram'

    # Instagram api requirements.
    # Required:
    #   * user_id
    #   * access_token
    self.required = %w(user_id access_token)

    # @private
    # Query instagram api with HTTParty
    def self.get
      instagram_call = HTTParty.get("https://api.instagram.com/v1/users/#{self.config.user_id}/media/recent?count=#{self.config.public[:post_count]}&access_token=#{self.config.access_token}")
      JSON.parse(instagram_call.body)['data']
    end

  end
end
