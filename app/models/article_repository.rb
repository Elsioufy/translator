class ArticleRepository
  def initialize(article)
    @article = article
  end

  def save_translated(attrs, lang)
    lang_article = @article.translations.with_locale(lang.to_sym).first_or_create!
    attrs.each do |key, value|
      lang_article[key] = value
    end
    lang_article.save!
  end
end