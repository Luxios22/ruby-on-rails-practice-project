# frozen_string_literal: true

class RemoveStatusFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :status, :integer
  end
end
