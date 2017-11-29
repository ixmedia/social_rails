require_dependency "social_rails/application_controller"

module SocialRails
  class SocialController < ApplicationController
    def latest
      render ["social_rails", params[:template], "latest"].compact.join("/"), layout: false
    end
  end
end