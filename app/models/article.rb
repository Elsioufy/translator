class Article < ApplicationRecord
  translates :question, :answer, touch: true
  accepts_nested_attributes_for :translations, allow_destroy: true
  self.per_page = 10

  class Translation
    validates :question, :answer, presence: true, uniqueness: true, if: -> { is_english? }
    def changed?
      (self.saved_change_to_question? || self.saved_change_to_answer?)
    end

    def is_english?
      self.locale.to_s == 'en'
    end
  end
end
