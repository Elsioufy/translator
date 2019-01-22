module Aws
  class TranslateService
    MAX_RETRIES = 10
    def self.translate(text, source_lang, target_lang)
      retries = 0
      begin
        client = Aws::Translate::Client.new
        resp = client.translate_text({
          text: text,
          source_language_code: source_lang,
          target_language_code: target_lang
        })
        return resp.translated_text
      rescue Exception => e
        retries += 1
        if retries < MAX_RETRIES
          retry
        else
          raise e
        end
      end
    end
  end
end