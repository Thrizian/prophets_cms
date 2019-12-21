# frozen_string_literal: true

# Keep track of who edited which section at what moment
class CreateSectionEdits < ActiveRecord::Migration[5.2]
  def change
    create_table :section_edits do |t|
      t.integer :admin_user_id
      t.integer :section_id
      t.string :summary

      t.timestamps
    end

    add_index(:section_edits, %i[admin_user_id section_id])
  end
end
