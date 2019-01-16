require 'detect_language'

module SocialRails
  module Language

    def self.included base
      base.extend LanguageMethods
    end

    module LanguageMethods

      def localized?
        return self.config.public.has_key?(:lang) && self.config.public[:lang].is_a?(Array)
      end

      def languages
        return self.config.public[:lang]
      end

      def default_lang
        self.config.public[:lang] ? self.config.public[:lang].first : 'fr'
      end

      def lang_is_detected? text
        return true unless localized?
        DetectLanguage.detect(text).each do |result|
          return true if self.config.public[:lang].include? result["language"]
        end
        return false
      end

      private

    end
  end
end