# frozen_string_literal: true

require "rails_helper"

RSpec.describe BookSuggestion, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = User.create!(email: "test@example.com", password: "password123", username: "testuser")
      book_suggestion = BookSuggestion.new(title: "Valid Title", user: user)
      expect(book_suggestion).to be_valid
    end

    it "is not valid without a title" do
      book_suggestion = BookSuggestion.new(title: nil)
      expect(book_suggestion).not_to be_valid
    end
  end

  describe "associations" do
    it "belongs to user" do
      assoc = BookSuggestion.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
