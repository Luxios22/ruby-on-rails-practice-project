# frozen_string_literal: true

class Librarian::BooksController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  authorize_resource class: false

  layout "librarian"

  def index
    if params.dig(:q, :overdue_eq) == "1"
      @q = Book.with_attached_cover.includes(:borrowing).joins("JOIN user_activities ON user_activities.book_id = books.id").where("user_activities.type = 'Borrowing'").where("user_activities.created_at < ?", Time.now - 13.days).where("user_activities.active = true").ransack(params[:q])
    else
      @q = Book.includes(:borrowing).with_attached_cover.ransack(params[:q])
    end
    @pagy, @books = pagy(@q.result)

    current_page = params[:page]
    !current_page ? current_page = 1 : current_page = current_page.to_i

    @books_count = @pagy.count
    @book_start = [((current_page - 1) * Pagy::DEFAULT[:items].to_i) + 1, @pagy.count].min
    @book_end = [current_page * Pagy::DEFAULT[:items].to_i, @pagy.count].min
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to action: "index"
    else
      errors = []
      @book.errors.full_messages.each do |error|
        errors << error
      end
      flash[:alert] = errors.join(", ")
      redirect_to librarian_book_path(@book)
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to action: "index"
    else
      errors = []
      @book.errors.full_messages.each do |error|
        errors << error
      end
      flash[:alert] = errors.join(", ")
      redirect_to action: "new"
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :isbn, :category_id, :cover)
  end

  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: "You are not authorized to access this page."
  end

  rescue_from ActiveRecord::RecordInvalid do
    redirect_to root_url, alert: "You are not authorized to access this page."
  end
end
