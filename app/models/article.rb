class Article < ApplicationRecord
  validates :question, :answer, presence: true, uniqueness: true
  translates :question, :answer, touch: true
  after_save :translate_article

  private
    def translate_article

    end
end
