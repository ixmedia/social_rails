module SocialRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # Patch for the authoreyes gem
    def redirect_if_unauthorized(document_role=nil)
    end
  end
end
