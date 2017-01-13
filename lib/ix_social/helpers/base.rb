module IxSocial
  module Helpers

    class Base < Tag

      def initialize(template, content, config)
        @template, @content, @config = template, content, config
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
