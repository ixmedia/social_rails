module SocialRails
  class Engine < ::Rails::Engine
    isolate_namespace SocialRails

    require 'social_rails/helpers/helper_methods'
    initializer "social_rails.view_helpers" do
      ActionView::Base.send :include, SocialRails::Helpers::HelperMethods
    end
  end
end
