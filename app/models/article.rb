class Article < ApplicationRecord
  translates :question, :answer
  accepts_nested_attributes_for :translations, allow_destroy: true
  self.per_page = 10

  def en_question
    get_translations('en').question if get_translations('en').present?
  end

  def en_answer
    get_translations('en').answer if get_translations('en').present?
  end

  def de_question
    get_translations('de').question if get_translations('de').present?
  end

  def de_answer
    get_translations('de').answer if get_translations('de').present?
  end

  def get_translations(locale)
    self.translations.find_by(locale: locale)
  end

  class Translation
    # TODO: Rails admin has bugs with validating globalize translaton fields
    # validates :question, :answer, presence: true, uniqueness: true, if: -> { is_english? }
    def changed?
      (self.saved_change_to_question? || self.saved_change_to_answer?)
    end

    def is_english?
      self.locale.to_s == 'en'
    end
  end
end
