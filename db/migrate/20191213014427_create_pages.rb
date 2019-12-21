# frozen_string_literal: true

# Pages belong to subjects and are made up out of several sections
# of content they have a permalink that allows for navigation.
class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :subject_id
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, default: false

      t.timestamps
    end

    add_index(:pages, :subject_id)
    add_index(:pages, :permalink)
  end
end
