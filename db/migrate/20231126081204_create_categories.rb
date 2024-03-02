# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    add_reference :books, :category, index: true, foreign_key: true
  end
end
