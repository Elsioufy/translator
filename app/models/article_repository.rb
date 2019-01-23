# Following DDD, Article repository is used to set and get our article since it has interaction with our translations
class ArticleRepository
  # Initializing our article
  def initialize(article)
    @article = article
  end
  # Saving our translated article into our database.
  def save_translated(attrs, lang)
    puts "Attrs are: #{attrs}"
    # Getting/Creating the article at which we are going to save our translated attributes in
    lang_article = @article.translations.with_locale(lang.to_sym).first_or_create!
    # Save our attributes
    attrs.each do |key, value|
      lang_article[key] = value
    end
    # Save our translated article.
    lang_article.save!
    lang_article
  end
end