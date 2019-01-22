# Observer to catch events/callbacks of Article, used for single responsibility and efficient testing.
class ArticleObserver < ActiveRecord::Observer
  observe Article::Translation

  def after_save(article_translation)
    if article_translation.is_english? && article_translation.changed?
      ArticleService.translate(article_translation, 'en', 'de')
    end
  end
end