# Following DDD, Article repository is used to set and get our article
class ArticleRepository
  # Initializing our article
  def initialize(article)
    @article = article
  end
  # Saving our translated article into our database.
  def save_translated(attrs, lang)
    puts "Attrs are: #{attrs}"
    lang_article = @article.translations.with_locale(lang.to_sym).first_or_create!
    attrs.each do |key, value|
      lang_article[key] = value
    end
    lang_article.save!
  end
end