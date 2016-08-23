class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.index :auth_token, :unique => true
      t.index :email, :unique => true
      t.timestamps
    end
  end
end
