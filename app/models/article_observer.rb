# Observer to catch events/callbacks of Article, used for single responsibility and efficient testing.
class ArticleObserver < ActiveRecord::Observer
  observe Article::Translation

  def after_save(article_translation)
    # Only translate articles that are english and changed.
    if article_translation.is_english? && article_translation.changed?
      # No need to use a sidekiq worker, since Aws is highly available and it is on demand to translate articles.
      # Service to transalte the article
      ArticleService.translate(article_translation, 'en', 'de')
    end
  end
end