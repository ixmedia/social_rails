class IxSocial::TwitterController < IxSocialController

  def content
    super IxSocial::API::Twitter.latest
  end

end
