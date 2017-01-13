module IxSocial
  module Helpers
    class Tag
      def initialize(template, content, scope, config)
        @template, @content, @scope, @config = template, content, scope, config
      end

      def to_s(locals = {})
        @template.render partial: partial_path, locals: locals
      end

      def partial_path
        [
          "ix_social",
          @scope,
          self.class.name.demodulize.underscore
        ].compact.join("/")
      end

    end

  end
end
