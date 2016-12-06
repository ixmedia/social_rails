require 'ix_social/engine'
require 'ix_social/utils'

module IxSocial

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    max_characters: 140
  }

end

require 'ix_social/cache'
require 'ix_social/medias/facebook'
require 'ix_social/medias/instagram'
