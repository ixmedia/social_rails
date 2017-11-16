module SocialRails
  module Helpers

    class Twitter < Base
      def initialize(template, content, scope, config)
        @tags = %w(tweet)
        super
      end
    end

    class Tweet < Tag
      def to_s(locals = {})
        locals[:tweet] = @content.html
        super(locals)
      end
    end

  end
end
