class AddRatingToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :rating, :integer, null: false, null: false, default: 1
  end
end
