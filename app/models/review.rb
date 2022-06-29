class Review < ApplicationRecord
  belongs_to :recipes

  validates :content, presence: true
end
