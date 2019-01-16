module SocialRails
  module API

    class Base

      include Cache
      include Language

      class << self
        attr_accessor :uid
        attr_accessor :required
      end

      # Allow for configure block
      def self.configure
        yield config
      end

      # Return module configurations
      def self.config
        @config ||= OpenStruct.new(SocialRails::DEFAULT_CONFIG)
      end

      # Standardize namespace
      def self.namespace
        "social_rails/#{self.uid}"
      end

      # Make sure that all required configs are set
      def self.configured?
        self.required.all? { |required_config| !self.config[required_config].nil? }
      end

      def self.set_public_options options
        # Expire cache to allow api querying
        if options.has_key?(:post_count) && options[:post_count] > self.config.public[:post_count]
          self.expire
        end

        self.config.public = self.config.public.merge(options)
      end

    end
  end
end
