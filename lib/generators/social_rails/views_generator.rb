module SocialRails
  # rails g social_rails:views
  class ViewsGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../app/views/social_rails', __FILE__)

    class_option :medias, type: :array

    def copy_views
      medias = options[:medias]

      if medias.nil?
        copy_all_views
      else
        FileUtils.mkdir app_views_path unless File.exists? app_views_path
        medias.each { |m| copy_media(m) }
        copy_media('shared')
      end
    end

    private

    def copy_all_views
      FileUtils.copy_entry self.class.source_root, app_views_path
    end

    def copy_media media
      FileUtils.copy_entry get_media_path(media), app_views_path(media)
    end

    def app_views_path media = ""
      ['app', 'views', 'social_rails', media].compact.join('/')
    end

    def get_media_path media
      [self.class.source_root, media].compact.join('/')
    end

  end
end
