class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "id", "title", "updated_at"]
  end
end
