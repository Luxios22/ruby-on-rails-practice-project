# frozen_string_literal: true

require "rails_helper"

RSpec.describe "BookSuggestions", type: :request do
  fixtures :users

  before do
    user = users(:test_user) # Load a user from the fixtures
    sign_in user # Simulate user login
  end

  describe "GET /new" do
    it "returns http success" do
      get new_book_suggestion_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) {
      { book_suggestion: { title: "New Book Title", author: "Author Name", isbn: "123-456-789", details: "Some details about the book" } }
    }

    let(:invalid_attributes) {
      { book_suggestion: { title: "" } } # Assuming title is required and can't be blank
    }

    it "creates a new Book Suggestion with valid attributes" do
      expect {
        post book_suggestions_path, params: valid_attributes
      }.to change(BookSuggestion, :count).by(1)
    end

    it "does not create a new Book Suggestion with invalid attributes" do
      expect {
        post book_suggestions_path, params: invalid_attributes
      }.not_to change(BookSuggestion, :count)
    end
  end
end
