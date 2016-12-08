module IxSocialHelper

  def ix_social media, options = {}
    method = "ix_social_" + media.to_s
    send(method, options) if %w(facebook instagram).include?(media.to_s)
  end

  def ix_social_facebook options = {}
    IxSocial::Facebook.set_public_options(options)
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Facebook.uid}
  end

  def ix_social_instagram options = {}
    IxSocial::Instagram.set_public_options(options)
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Instagram.uid}
  end
end
