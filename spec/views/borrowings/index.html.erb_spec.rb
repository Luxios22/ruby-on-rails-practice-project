# frozen_string_literal: true

require "rails_helper"

RSpec.describe "borrowings/index", type: :view do
  fixtures :users, :user_activities, :books
  it "renders user's borrowings page" do
    assign(:borrowings, user_activities)
    render
    expect(rendered).to match(books(:first).title).and match(books(:first).author)
  end
end
