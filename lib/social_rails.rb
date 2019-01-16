require 'social_rails/engine'

module SocialRails

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    public: {
      max_characters: 0,
      post_count: 1,
      refresh: false,
      refresh_time: 15.minutes.in_milliseconds
    }
  }

end

require 'social_rails/cache'
require 'social_rails/language'
require 'social_rails/apis/base'
require 'social_rails/apis/facebook'
require 'social_rails/apis/instagram'
require 'social_rails/apis/twitter'
require 'social_rails/helpers/tag'
require 'social_rails/helpers/base'
require 'social_rails/helpers/facebook'
require 'social_rails/helpers/instagram'
require 'social_rails/helpers/twitter'
