# frozen_string_literal: true

require "rails_helper"

RSpec.describe "book_suggestions/new", type: :view do
  before(:each) do
    assign(:book_suggestion, BookSuggestion.new)
  end

  it "renders new book suggestion form" do
    render

    assert_select "form[action=?][method=?]", book_suggestions_path, "post" do
      assert_select "input[name=?]", "book_suggestion[title]"
      # Add other fields as necessary
    end
  end
end
