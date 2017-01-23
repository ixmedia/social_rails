class IxSocial::SocialController < ApplicationController
  def latest
    render ["ix_social", params[:template], "latest"].compact.join("/"), layout: false
  end
end
