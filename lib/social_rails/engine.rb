require 'social_rails/helpers/helper_methods'

module SocialRails
  class Engine < ::Rails::Engine
    isolate_namespace SocialRails

    initializer :add_to_precompile do |app|
      app.config.assets.precompile += %w( social_rails/social-rails.js )
    end

    initializer :include_view_helpers do
      ActionView::Base.send :include, SocialRails::Helpers::HelperMethods
    end
  end
end
