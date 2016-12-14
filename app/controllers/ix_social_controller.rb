class IxSocialController < ActionController::Base
  require 'ix_social'

  protected

  def render_social social
    # @posts = posts
    # render posts.nil? ? "ix_social/shared/config.html.erb" : "ix_social/#{social}/latest.html.erb"
  end
end
