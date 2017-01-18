require 'ix_social/engine'

module IxSocial

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    public: {
      max_characters: 0,
      post_count: 1
    }
  }

end

require 'ix_social/cache'
require 'ix_social/apis/base'
require 'ix_social/apis/facebook'
require 'ix_social/apis/instagram'
require 'ix_social/apis/twitter'
require 'ix_social/helpers/tag'
require 'ix_social/helpers/base'
require 'ix_social/helpers/facebook'
require 'ix_social/helpers/instagram'
require 'ix_social/helpers/twitter'
