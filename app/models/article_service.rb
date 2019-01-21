class ArticleService
  def self.translate(article_translation, source_lang, target_lang)
    translated_question = Aws::TranslateService.translate(article_translation.question, source_lang, target_lang)
    translated_answer = Aws::TranslateService.translate(article_translation.answer, source_lang, target_lang)
    article_attrs = {question: translated_question, answer: translated_answer}
    # TODO, now article_translation.article not implemented in globalize gem, adding belongs_to caused other issues to validation.
    article_repo = ArticleRepository.new(Article.find(article_translation.article_id))
    article_repo.save_translated(article_attrs, target_lang)
  end
end