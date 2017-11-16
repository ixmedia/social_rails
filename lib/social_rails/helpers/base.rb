module SocialRails
  module Helpers

    class Base < Tag
      def initialize(template, content, scope, config)

        @template, @content, @scope, @config = template, content, scope, config
        # @tags ||= []

        @tags.each do |tag|
          eval <<-DEF, nil, __FILE__, __LINE__ + 1
            def #{tag}_tag
              #{tag.classify}.new @template, @content, @scope, @config
            end
          DEF
        end

        @output_buffer = if defined?(::ActionView::OutputBuffer)
          ::ActionView::OutputBuffer.new
        else
          ActiveSupport::SafeBuffer.new
        end
      end

      def render(&block)
        instance_eval(&block)
        @output_buffer
      end
    end


  end
end
