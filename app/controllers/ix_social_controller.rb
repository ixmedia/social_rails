class IxSocialController < ActionController::Base
  require 'ix_social'

  helper_method :content

  def latest
  end

  protected

  def content(latest = [])
    latest
  end

end
