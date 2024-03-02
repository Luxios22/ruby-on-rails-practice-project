# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend
  layout :custom_layout


  def index
    @pagy, @books = pagy(@q.result, items: 8)
  end

  def show
    @book = Book.includes(:category).find(params[:id])
    @book = Book.find(params[:id])
  end

  def search
    @pagy, @books = pagy(@q.result, items: 8)
  end

  private
    def custom_layout
      return "turbo_rails/frame" if turbo_frame_request?
      "user"
    end
end
