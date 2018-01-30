module SocialRails
  class SocialController < SocialRails::ApplicationController
    def latest
      render ["social_rails", params[:template], "latest"].compact.join("/"), layout: false
    end
  end
end
