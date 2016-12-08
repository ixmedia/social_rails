module IxSocial
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
      def latest
        Rails.cache.fetch(self.namespace, {expires_in: self.config.cooldown}) do
          self.get
        end
      end

      # Expire namespace from cache
      def expire
        Rails.cache.delete(self.namespace)
      end
    end
  end
end
