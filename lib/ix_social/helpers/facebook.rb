module IxSocial
  module Helpers

    class Facebook
      def initialize
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

      %w[full_picture].each do |tag|
        eval <<-DEF, nil, __FILE__, __LINE__ + 1
          def #{tag}_tag
            render partial: 'ix_social/facebook/#{tag}.html.erb'
          end
        DEF
      end
    end
  end
end
