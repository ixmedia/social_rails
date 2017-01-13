class IxSocial::InstagramController < IxSocialController

  def content
    super IxSocial::Instagram.latest
  end
end
