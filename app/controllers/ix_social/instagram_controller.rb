class IxSocial::InstagramController < IxSocialController
  require 'ix_social'

  def latest
    render_social IxSocial::Instagram.latest, IxSocial::Instagram.uid
  end
end
