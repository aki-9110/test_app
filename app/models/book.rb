class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "author", "created_at", "id", "title", "updated_at" ]
  end

  # 星5評価のステータス
  enum rating: {
    very_poor: 1,
    poor: 2,
    fair: 3,
    good: 4,
    excellent: 5
  }
end
