class IxSocial::FacebookController < IxSocialController
  
  def content
    super IxSocial::Facebook.latest
  end
end
