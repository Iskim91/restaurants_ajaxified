class RemovecocktailsfromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :cocktails_id
    add_reference :reviews, :cocktail, foreign_key: true
  end
end
