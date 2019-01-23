# Article Service class
class ArticleService
  # Used to translate our article given:
  # - Our Article
  # - Our source language
  # - Our target language

  def initialize(article_translation, source_lang, target_lang)
    @article_translation = article_translation
    @source_lang = source_lang
    @target_lang = target_lang
    # TODO: now article_translation.article not implemented in globalize gem, 
    # adding belongs_to caused other issues to wrong validation which does not allow to save the article.
    @article = Article.find(@article_translation.article_id)
  end
  def translate
    aws_translate_service = Aws::TranslateService.new
    translated_question = aws_translate_service.translate(@article_translation.question, @source_lang, @target_lang)
    translated_answer = aws_translate_service.translate(@article_translation.answer, @source_lang, @target_lang)
    translated_article_attrs = {question: translated_question, answer: translated_answer}
    article_repo = ArticleRepository.new(@article)
    article_repo.save_translated(translated_article_attrs, @target_lang)
  end
end