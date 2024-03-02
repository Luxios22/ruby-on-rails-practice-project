# frozen_string_literal: true

class ChangeStatusToEnumForBooks < ActiveRecord::Migration[7.1]
  def up
    execute "ALTER TABLE books ALTER status DROP DEFAULT;"
    change_column :books, :status, :integer, using: "status::integer"
  end

  def down
    change_column :books, :status, :string, default: "available"
  end
end
