class ArticleObserver < ActiveRecord::Observer
  observe Article::Translation

  def after_save(article_translation)
    if article_translation.is_english? && article_translation.changed?
      ArticleService.translate(article_translation, 'en', 'de')
    end
  end
end