# frozen_string_literal: true

require "rails_helper"

RSpec.describe "home/show", type: :view do
  fixtures :books
  it "renders home page" do
    assign(:books, books)
    render
    books.map do |book|
      expect(rendered).to match(CGI.escapeHTML(book.title))
    end
  end
end
