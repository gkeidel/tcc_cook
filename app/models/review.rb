class Review < ApplicationRecord
  belongs_to :recipe

  validates :content, presence: { message: "must be given please" }

end
