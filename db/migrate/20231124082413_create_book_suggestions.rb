# frozen_string_literal: true

class CreateBookSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :book_suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.string :isbn
      t.text :details

      t.timestamps
    end
  end
end
