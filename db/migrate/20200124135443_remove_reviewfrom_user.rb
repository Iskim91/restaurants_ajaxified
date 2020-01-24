class RemoveReviewfromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :review_id
    add_reference :reviews, :user, foreign_key: true
  end
end
