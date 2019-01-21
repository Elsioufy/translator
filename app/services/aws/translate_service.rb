module Aws
  class TranslateService
    def self.translate(text, source_lang, target_lang)
      client = Aws::Translate::Client.new
      resp = client.translate_text({
        text: text,
        source_language_code: source_lang,
        target_language_code: target_lang
      })
      return resp.translated_text
    end
  end
end