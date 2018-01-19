module SocialRails
  module Helpers
    class Tag
      def initialize(template, content, scope, config)
        @template, @content, @scope, @config, @options = template, content, scope, config
      end

      def to_s(locals = {})
        @template.render partial: partial_path, locals: locals
      end

      def partial_path
        [
          "social_rails",
          @scope,
          self.class.name.demodulize.underscore
        ].compact.join("/")
      end

      def truncate(the_content)
        the_content.truncate(@config.public[:max_characters], separator: ' ')
      end

    end

  end
end
