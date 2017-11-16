module SocialRails
    # rails g social_rails:config
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies social_rails configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'social_rails_config.rb', 'config/initializers/social_rails.rb'
      end
    end
end
