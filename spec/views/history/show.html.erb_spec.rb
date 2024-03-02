# frozen_string_literal: true

require "rails_helper"

RSpec.describe "history/show", type: :view do
  fixtures :user_activities, :users, :books
  it "renders user's history page" do
    assign(:history, user_activities)
    render
    expect(rendered).to match(books(:first).title).and match(books(:first).author)
  end
end
