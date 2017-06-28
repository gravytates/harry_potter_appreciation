class AddCharacteridToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :character_id, :integer
  end
end
