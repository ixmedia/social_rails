module IxSocial
  class Engine < ::Rails::Engine
    isolate_namespace IxSocial

    initializer "ix_social.view_helpers" do
      ActionView::Base.send :include, IxSocialHelper
    end
  end
end
