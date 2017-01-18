class IxSocial::InstagramController < IxSocialController

  def content
    super IxSocial::API::Instagram.latest
  end
end
