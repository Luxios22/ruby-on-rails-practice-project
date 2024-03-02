# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Devises", type: :feature do
  it "Logging in user shows special content" do
    visit user_session_path

    expect(page).to have_content("Password")
  end
end
