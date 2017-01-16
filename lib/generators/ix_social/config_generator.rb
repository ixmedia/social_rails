module IxSocial
    # rails g ix_social:config
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies ix social configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'ix_social_config.rb', 'config/initializers/ix_social.rb'
      end
    end
end
