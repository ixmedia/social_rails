class IxSocial::TwitterController < IxSocialController

  def content
    super IxSocial::Twitter.latest
  end

end
