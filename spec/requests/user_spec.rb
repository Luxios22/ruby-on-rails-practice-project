# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  fixtures :users

  describe "GET /profile" do
    it "redirect to login page for unauthenticated users" do
      get "/profile"
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success for authenticated users" do
      sign_in users(:test_user)
      get "/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "redirect to login page for unauthenticated users" do
    it "redirect to login page for unauthenticated users" do
      get "/profile/edit"
      expect(response).to redirect_to(new_user_session_path)
    end
    it "returns http success for authenticated users" do
      sign_in users(:test_user)
      get "/profile/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
