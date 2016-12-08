require 'ix_social/engine'

module IxSocial

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    public: {
      max_characters: 140,
      post_count: 1
    }
  }

end

require 'ix_social/cache'
require 'ix_social/base'
require 'ix_social/facebook'
require 'ix_social/instagram'
