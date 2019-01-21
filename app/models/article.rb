class Article < ApplicationRecord
  validates :question, :answer, presence: true, uniqueness: true
end
