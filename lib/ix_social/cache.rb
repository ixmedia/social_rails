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
        
        unless Rails.cache.exist?(self.namespace)
          Rails.cache.write(self.namespace, self.get, {expires_in: self.config.cooldown})
        end

        Rails.cache.fetch(self.namespace)

      end

      # Expire namespace from cache
      def expire
        p self.namespace
        Rails.cache.delete(self.namespace)
      end
    end
  end
end
