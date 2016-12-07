class IxSocialController < ActionController::Base
  require 'ix_social'

  helper IxSocial::Engine.helpers
  
  protected

  def render_social post, social
    @post = post
    render post.nil? ? "shared/config.html.erb" : "#{social}/latest.html.erb"
  end

end
