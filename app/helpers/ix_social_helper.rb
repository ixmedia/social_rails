module IxSocialHelper
  def ix_social_facebook
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Facebook.uid}
  end

  def ix_social_instagram
    render partial: 'shared/placeholder', locals: {namespace: IxSocial::Instagram.uid}
  end
end
