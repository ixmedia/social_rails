
class IxSocial::FacebookController < IxSocialController
  require 'ix_social'

  def latest
    @post = IxSocial::Facebook.latest
    render 'facebook/latest'
  end

end
