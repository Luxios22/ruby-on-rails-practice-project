# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User controller (Devise)", type: :request do
  fixtures :users

  it "registers a user with 'Regular' role" do
    register("test1234")
    expect(User.find_by(email: "test@email.com")).to be_regular
  end

  context "tests fixtures and" do
    it "checks if fixtures are loaded" do
      expect(User.find_by(email: "old@email.com")).to be_present
      expect(User.find_by(email: "librarian@email.com")).to be_present
    end

    it "logs in a user that is inserted as a fixture" do
      login("old@email.com", "test1234")
      expect(response.status).to eq(303)
    end
  end

  context "checks password complexity and" do
    it "registers a user with strong password" do
      expect { register("test1234") }.to change { User.count }.by(1)
    end

    it "does not register a user, because password is too short" do
      expect { register("abc") }.to change { User.count }.by(0)
    end

    it "does not register a user, because password does not contain symbol or number" do
      expect { register("Abcdefgh") }.to change { User.count }.by(0)
    end

    it "does not register a user, because password does not contain letter" do
      expect { register("12345678") }.to change { User.count }.by(0)
    end
  end

  context "edits profile and" do
    let (:email) { "old@email.com" }
    let (:new_email) { "new@email.com" }
    let (:password) { "test1234" }
    let (:new_password) { "password123" }

    it "can change email and password" do
      login(email, password)
      patch user_registration_path, params: { user: { email: new_email, password: new_password, password_confirmation: new_password, current_password: password } }
      expect(User.find_by(email: new_email)).to be_present
      expect(User.find_by(email: email)).to be_nil
    end

    it "cannot change email and password, when current password is wrong" do
      login(email, password)
      patch user_registration_path, params: { user: { email: new_email, password: new_password, password_confirmation: new_password, current_password: "wrong_password" } }
      expect(User.find_by(email: new_email)).to be_nil
      expect(User.find_by(email: email)).to be_present
    end

    it "can only change email by leaving password fields blank" do
      login(email, password)
      patch user_registration_path, params: { user: { email: new_email, password: "", password_confirmation: "", current_password: password } }
      expect(User.find_by(email: new_email)).to be_present
      expect(User.find_by(email: email)).to be_nil
    end
  end

  private
    def register(password)
      post user_registration_path, params: { user: { email: "test@email.com", username: "test", password: password, password_confirmation: password } }
    end
end
