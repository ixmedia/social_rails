module IxSocialHelper

  def ixsocial media, options = {}
    method = "ixsocial_" + media.to_s
    send(method, options) if %w(facebook instagram).include?(media.to_s)
  end

  def ixsocial_facebook options = {}
    IxSocial::Facebook.set_public_options(options)
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Facebook.uid}
  end

  def ixsocial_instagram options = {}
    IxSocial::Instagram.set_public_options(options)
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Instagram.uid}
  end
end
