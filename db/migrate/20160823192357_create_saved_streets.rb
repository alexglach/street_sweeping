class CreateSavedStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_streets do |t|
      t.integer :user_id, :null => false
      t.string :street_id, :null => false
      t.index [:user_id, :street_id], :unique => true
      t.timestamps
    end
  end
end
