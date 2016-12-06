class IxSocial::InstagramController < IxSocialController

  def latest
    @post = IxSocial::Instagram.latest
    render "#{IxSocial::Instagram.uid}/latest.html.erb"
  end

end
