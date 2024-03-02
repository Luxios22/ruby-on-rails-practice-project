# frozen_string_literal: true

class CreateUserActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :user_activities do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :book, null: false, foreign_key: true, index: true
      t.boolean :active, null: false, default: true
      t.string :type

      t.timestamps
    end
  end
end
