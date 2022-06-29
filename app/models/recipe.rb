class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:name, :stuff]
  
  validates :name, :stuff, :duration, presence: { message: "must be given please" }

  def self.created_at
    where('created_at <= ?', Time.now).order('created_at desc')
  end
end
