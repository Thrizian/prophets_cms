# This table maintains the many to many relationship between
# administrators and pages.
class CreateAdminUsersPages < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users_pages, id: false do |t|
      t.integer :admin_user_id
      t.integer :page_id
    end

    add_index(:admin_users_pages, %i[admin_user_id page_id])
  end
end
