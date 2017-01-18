class IxSocial::FacebookController < IxSocialController

  def content
    super IxSocial::API::Facebook.latest
  end
end
