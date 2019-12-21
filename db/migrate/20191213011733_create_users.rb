# frozen_string_literal: true

# This table creates the users that will be able to manipulate the database
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :first_name, limit: 30
      t.string :last_name
      t.string :email, default: '', null: false, limit: 100
      t.string :username, limit: 25
      t.string :hashed_password, limit: 40

      t.timestamps
    end

    add_index :admin_users, :username
  end
end
