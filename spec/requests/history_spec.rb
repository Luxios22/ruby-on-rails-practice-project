# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Histories", type: :request do
  fixtures :users

  describe "GET /history" do
    it "redirect to login page for unauthenticated users" do
      get "/history"
      expect(response).to redirect_to(new_user_session_path)
    end
    it "returns http success for authenticated users" do
      sign_in users(:test_user)
      get "/history"
      expect(response).to have_http_status(:success)
    end
  end
end
