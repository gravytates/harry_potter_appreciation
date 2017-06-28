class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :location
      t.integer :rating, default: 0
      t.timestamps
    end
  end
end
