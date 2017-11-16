class SocialRails::SocialController < ActionController::Base
  def latest
    render ["social_rails", params[:template], "latest"].compact.join("/"), layout: false
  end
end
