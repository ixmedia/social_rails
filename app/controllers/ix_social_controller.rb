class IxSocialController < ActionController::Base
  require 'ix_social'

  helper IxSocial::Engine.helpers

  protected

  def render_social posts, social
    @posts = posts
    render posts.nil? ? "shared/config.html.erb" : "#{social}/latest.html.erb"
  end
end
