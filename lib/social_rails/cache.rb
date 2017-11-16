module SocialRails
  module Cache

    def self.included base
      base.extend CacheMethods
    end

    # Methods used to manage cache
    module CacheMethods

      # Manage cache state
      #
      # Write to namespace if namespace is nonexistent.
      # Return cache namespace content.
      # Returns nil if media isn't configured
      def latest
        if self.configured?
          Rails
            .cache
            .fetch(self.namespace, {expires_in: self.config.cooldown}) { self.get }
            .take(self.config.public[:post_count])
        end
      end

      # Expire namespace from cache
      def expire
        Rails.cache.delete(self.namespace)
      end
    end
  end
end
