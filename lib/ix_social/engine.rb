module IxSocial
  class Engine < ::Rails::Engine
    isolate_namespace IxSocial

    require 'ix_social/helpers/helper_methods'
    initializer "ix_social.view_helpers" do
      ActionView::Base.send :include, IxSocial::Helpers::HelperMethods
    end
  end
end
