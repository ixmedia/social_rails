module IxSocial
  class Engine < ::Rails::Engine

    initializer "ix_social.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include IxSocial::Controller::Helpers
      end

      ActiveSupport.on_load(:action_view) do
        include IxSocial::View::Helpers
      end
    end
  end
end
