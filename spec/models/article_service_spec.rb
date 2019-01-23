require 'rails_helper'

describe ArticleService do
  context 'Articles gets translated' do
    it 'Should save the translated article' do
      article = create(:article, :simple)
      aws_translate_service = instance_double(Aws::TranslateService)
      allow(Aws::TranslateService).to receive(:new).and_return(aws_translate_service)
      translated_question = 'Frage?'
      translated_answer = 'Antworten'
      allow(aws_translate_service).to receive(:translate).with('Question?', 'en', 'de').and_return(translated_question)
      allow(aws_translate_service).to receive(:translate).with('Answer', 'en', 'de').and_return(translated_answer)
      article_service = ArticleService.new(article.translations.find_by(locale: :en), 'en', 'de')
      translated_article = article_service.translate
      expect(translated_article).to_not eq(nil)
      expect(translated_article.question).to eq(translated_question)
      expect(translated_article.answer).to eq(translated_answer)
    end
  end
end
