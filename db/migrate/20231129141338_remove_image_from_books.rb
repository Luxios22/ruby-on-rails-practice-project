# frozen_string_literal: true

class RemoveImageFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :image, :string
  end
end
