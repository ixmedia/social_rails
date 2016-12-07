module IxSocial
  class Base

    include Cache

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
      @config ||= OpenStruct.new(IxSocial::DEFAULT_CONFIG)
    end

    # Standardize namespace
    def self.namespace
      "ix_social/#{self.uid}"
    end

    # Make sure that all required configs are set
    def self.configured?
      self.required.all? { |required_config| !self.config[required_config].nil? }
    end
  end
end
