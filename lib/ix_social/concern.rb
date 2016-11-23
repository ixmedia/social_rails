module IxSocial
  module Concern
    extend ActiveSupport::Concern

    included do
      before_action :facebook
    end

    def facebook
      @ix_social_facebook = IxSocial::Facebook.latest
    end
  end
end
