module IxSocial
  module Cache
    # Methods used to manage cache

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
      Rails.cache.delete(self.namespace)
    end

  end
end
