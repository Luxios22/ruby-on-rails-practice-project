# frozen_string_literal: true

class HomeController < ApplicationController
  layout "user"
  def show
    if current_user&.librarian?
      redirect_to librarian_books_path, status: :see_other
    end
    @books = Book.order(created_at: :desc).limit(4)
  end
end
