# frozen_string_literal: true

class BookSuggestion < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true
end
