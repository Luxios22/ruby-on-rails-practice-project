# frozen_string_literal: true

require "rails_helper"
# ActiveRecord.verbose_query_logs = true
# ActiveRecord::Base.logger = Logger.new(STDOUT)

RSpec.describe User, type: :model do
  let(:adam) { User.create!(username: "adam", email: "adam@email.com", password: "abc8920B02!") }
  let(:john) { User.create!(username: "john", email: "john@email.com", password: "abc890A1!") }
  let(:action) { Category.create!(name: "action") }
  let(:book1) { Book.create!(title: "book1", author: "author", category_id: action.id, description: "description") }
  let(:book2) { Book.create!(title: "book2", author: "author", category_id: action.id, description: "description") }
  let(:book3) { Book.create!(title: "book3", author: "author", category_id: action.id, description: "description") }
  let(:book4) { Book.create!(title: "book4", author: "author", category_id: action.id, description: "description") }
  let(:book5) { Book.create!(title: "book5", author: "author", category_id: action.id, description: "description") }
  let(:book6) { Book.create!(title: "book6", author: "author", category_id: action.id, description: "description") }
  describe "Borrow books" do
    it "successfully borrow and return a book" do
      adam.borrow(book1)
      expect(adam.borrowing_books).to include(book1)
      expect(book1.borrowing_user). to eq(adam)
      adam.return(book1)
      expect(adam.borrowing_books).to_not include(book1)
    end

    it "don't allow 2 users to borrow the same book at the same time" do
      adam.borrow(book1)
      expect { john.borrow(book1) }.to raise_error(ArgumentError)
    end

    it "don't allow an user to borrow the same book again before returning that book" do
      adam.borrow(book1)
      expect { adam.borrow(book1) }.to raise_error(ArgumentError)
    end

    it "allow an user to borrow the same book again after returning that book" do
      adam.borrow(book1)
      adam.return(book1)
      adam.borrow(book1)
      expect(adam.borrowing_books).to include(book1)
    end

    it "keep the borrowing record of user" do
      adam.borrow(book1)
      expect { adam.return(book1) }.to_not change(Borrowing, :count)
    end

    it "don't allow returning unborrowed books" do
      adam.borrow(book1)
      expect { john.return(book1) }.to raise_error(ArgumentError)
      expect { john.return(book2) }.to raise_error(ArgumentError)
    end

    it "don't allow borrowing more than 5 books" do
      adam.borrow(book1)
      adam.borrow(book2)
      adam.borrow(book3)
      adam.borrow(book4)
      adam.borrow(book5)
      expect { adam.borrow(book6) }.to raise_error(ArgumentError)
    end

    it "don't allow borrowing books when user have overdue books" do
      adam.borrow(book1)
      adam.borrow(book2)
      some_day_later = Time.now + 15.days
      allow(Time).to receive(:now).and_return(some_day_later)
      expect { adam.borrow(book6) }.to raise_error(ArgumentError)
    end
  end
end
