class IxSocial::SocialController < ActionController::Base
  def latest
    render ["ix_social", params[:template], "latest"].compact.join("/")
  end
end
