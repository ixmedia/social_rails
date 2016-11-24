module IxSocial
  module Controller
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method(%w(facebook instagram))
      end

      def facebook
        IxSocial::Facebook.latest
      end

      def instagram
        IxSocial::Instagram.expire
        IxSocial::Instagram.latest
      end

    end
  end
end
