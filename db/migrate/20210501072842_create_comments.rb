# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :recruitment_id
      t.text :text, null: false
      t.timestamps
    end
  end
end
