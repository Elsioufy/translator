module Aws
  # This class is used for Aws translate service exclusively. 
  # It is used to translate text based on source and destination language
  class TranslateService
    def initialize(max_retries=10)
      @client = Aws::Translate::Client.new
      @max_retries = max_retries
    end
    def translate(text, source_lang='en', target_lang='de')
      retries = 0
      begin
        @client = Aws::Translate::Client.new
        resp = @client.translate_text({
          text: text,
          source_language_code: source_lang,
          target_language_code: target_lang
        })
        @translated_text = resp.translated_text
        return resp.translated_text
      rescue Exception => e
        # Retry for maximum 10 times in case not specified
        retries += 1
        if retries < @max_retries
          retry
        else
          raise e
        end
      end
    end
  end
end