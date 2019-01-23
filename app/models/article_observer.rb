# Observer to catch events/callbacks of Article, used for single responsibility and efficient testing.
class ArticleObserver < ActiveRecord::Observer
  observe Article::Translation

  def after_save(article_translation)
    # Only translate articles that are english and changed.
    if article_translation.is_english? && article_translation.changed?
      # No need to use a sidekiq worker, since Aws is highly available and we want to save on live data
      # The traffic is much higher in the user level than the admin level
      # This is a service to translate the article
      article_service = ArticleService.new(article_translation, 'en', 'de')
      article_service.translate
    end
  end
end