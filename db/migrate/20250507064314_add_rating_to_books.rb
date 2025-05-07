class AddRatingToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :rating, :integer
  end
end
