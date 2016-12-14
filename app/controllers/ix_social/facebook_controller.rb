class IxSocial::FacebookController < IxSocialController
  require 'ix_social'

  def latest
    render_social IxSocial::Facebook.uid
  end
end
