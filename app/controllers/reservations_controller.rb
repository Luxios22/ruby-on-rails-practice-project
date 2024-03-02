# frozen_string_literal: true

class ReservationsController < ApplicationController
  layout "user"
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])

    if current_user.can_reserve_books?
      current_user.reservations.create(book: book, active: true, type: "Reservation")
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("reserve-book-action", partial: "books/reserve_button", locals: { book: book })
        end
        format.html { redirect_to book_path(book) }
      end
    else
      redirect_to book_path(book), alert: "Cannot reserve book. You have overdue books."
    end
  end

  # def create
  #   book = Book.find(params[:book_id])

  #   if current_user.can_reserve_books?
  #     current_user.reservations.create(book: book, active: true, type: 'Reservation')
  #     redirect_to book_path(book), notice: 'Book reserved successfully.'
  #   else
  #     redirect_to book_path(book), alert: 'Cannot reserve book. You have overdue books.'
  #   end
  # end

  def destroy
    reservation = current_user.reservations.find_by(id: params[:id])
    if reservation
      book = reservation.book
      reservation.destroy
      redirect_to book_path(book), notice: "Reservation cancelled successfully."
    else
      redirect_to books_path, alert: "Reservation not found."
    end
  end

  def index
    @reservations = current_user.reservations.where(active: true).includes(:book)
  end
end
