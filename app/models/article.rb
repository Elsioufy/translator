# Article model, each article has set of translations
class Article < ApplicationRecord
  # Attrs we want to translate
  translates :question, :answer, touch: true
  # Validates article question and answer to be present and unique
  validates :question, :answer, presence: true, uniqueness: true
  # Each article has nested attributes for translations
  accepts_nested_attributes_for :translations, allow_destroy: true
  # Used for pagination, number of articles per page.
  self.per_page = 10
  # Used for easy and better access of translation attributes
  globalize_accessors
  scope :recent, -> { includes(:translations).order(updated_at: :desc)}

  def self.recent_articles(page_no = 1)
    Article.recent.paginate(page: page_no)
  end

  # Used since we would observe the english translation itself which has the content of our attributes
  class Translation
    # Checks if our data changed
    def changed?
      (self.saved_change_to_question? || self.saved_change_to_answer?)
    end
    # checks if our source translation article is english.
    def is_english?
      self.locale.to_s == 'en'
    end
  end
end
