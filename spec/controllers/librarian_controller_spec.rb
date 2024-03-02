# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Librarian", type: :request do
  fixtures :users

  let (:new_email) { "newlib@email.com" }

  it "can add another librarian" do
    login("librarian@email.com", "test1234") # librarian login

    post librarian_librarians_path, params: {
      user: { email: new_email, username: "New Librarian", password: "test1234" }
    }
    new_librarian = User.find_by(email: new_email)

    expect(new_librarian).to be_present
    expect(new_librarian).to be_librarian
  end

  it "cannot be added by regular users" do
    login("old@email.com", "test1234") # regular user login

    post librarian_librarians_path, params: {
      user: { email: new_email, username: "New Librarian", password: "test1234" }
    }
    new_librarian = User.find_by(email: new_email)

    expect(new_librarian).to be_nil
  end
end
