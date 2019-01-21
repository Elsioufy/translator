class Article < ApplicationRecord
  validates :title, :body, presence: true, uniqueness: true
end
