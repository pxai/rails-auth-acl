class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :email
      t.datetime :created_at
      t.boolean :active

      t.timestamps null: false
    end
  end
end
