# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Librarian::Users", type: :request do
  fixtures :users

  describe "GET /index" do
    it "redirect to login path" do
      get "/librarian/users"
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success for librarian" do
      sign_in users(:test_librarian)
      get "/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "redirect to login path" do
      get "/librarian/users/#{users(:test_user).id}"
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success for librarian" do
      sign_in users(:test_librarian)
      get "/librarian/users/#{users(:test_user).id}"
      expect(response).to have_http_status(:success)
    end
  end
end
