require 'rails/railtie'
module IxSocial
  class Railtie < ::Rails::Railtie
    initializer "ix_social.action_view" do |app|
      ActiveSupport.on_load :action_view do
        require "ix_social/facebook/helpers"
        include IxSocial::ActionView::FacebookHelpers
      end
    end
  end
end
