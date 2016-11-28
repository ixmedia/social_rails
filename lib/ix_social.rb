require "ix_social/engine"
require 'ix_social/cache'

module IxSocial

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    max_characters: 140
  }

end

require 'ix_social/medias/facebook'
