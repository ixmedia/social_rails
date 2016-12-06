class IxSocial::FacebookController < IxSocialController
  require 'ix_social'

  def latest
    @post = IxSocial::Facebook.latest
    render "#{IxSocial::Facebook.uid}/latest.html.erb"
  end

end
 
