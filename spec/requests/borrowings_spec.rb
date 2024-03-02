# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Borrowings", type: :request do
  fixtures :users

  describe "GET /borrowings" do
    it "redirect to login page for unauthenticated users" do
      get "/borrowings"
      expect(response).to redirect_to(new_user_session_path)
    end
    it "show the page to authenticated users" do
      sign_in users(:test_user)
      get "/borrowings"
      expect(response).to have_http_status(:success)
    end
  end
end
