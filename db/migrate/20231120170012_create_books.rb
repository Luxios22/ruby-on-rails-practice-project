# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :image
      t.string :status, default: "available"

      t.timestamps
    end
  end
end
