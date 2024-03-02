# frozen_string_literal: true

class BorrowingsController < ApplicationController
  layout "user"
  before_action :authenticate_user!
  def index
    @borrowings = current_user.borrowings.order(updated_at: :desc)
  end
  def create
    book = Book.find(params[:book_id])
    begin
      current_user.borrow(book)
      redirect_to book_path(book)
    rescue ArgumentError => exception
      respond_to do |format|
        format.html { redirect_to books_path, alert: exception.message }
        format.turbo_stream { flash.now[:alert] = exception.message }
      end
    end
  end
  def destroy
    book = Borrowing.find(params[:id]).book
    begin
      current_user.return(book)
      redirect_to book_path(book)
    rescue ArgumentError => exception
      respond_to do |format|
        format.html { redirect_to books_path, alert: exception.message }
        format.turbo_stream { flash.now[:alert] = exception.message }
      end
    end
  end
end
