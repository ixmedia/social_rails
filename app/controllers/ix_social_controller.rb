class IxSocialController < ActionController::Base
  require 'ix_social'
  
  helper IxSocial::Engine.helpers

  if respond_to?(:helper_method)
    helper_method(%w(social_latest))
  end

  protected

  def social_latest
    puts 'ayy'
  end
end
