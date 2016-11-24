require 'ix_social/cache'

module IxSocial

  module Controller
    autoload :Helpers, 'ix_social/controllers/helpers'
  end

  module View
    autoload :Helpers, 'ix_social/views/helpers'
  end

  DEFAULT_CONFIG = {
    cooldown: 15.minutes,
    max_characters: 140
  }
end

require 'ix_social/facebook'
require 'ix_social/instagram'
require 'ix_social/engine'
