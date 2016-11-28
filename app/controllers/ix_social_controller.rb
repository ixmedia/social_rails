class IxSocialController < ActionController::Base

  helper IxSocial::Engine.helpers

  if respond_to?(:helper_method)
    helper_method(%w(social_latest))
  end

  protected

  def social_latest
    puts 'ayy'
  end
end
