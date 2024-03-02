# frozen_string_literal: true

class BookSuggestionsController < ApplicationController
  before_action :authenticate_user!

  # GET /book_suggestions/new
  def new
    @book_suggestion = BookSuggestion.new
  end

  # POST /book_suggestions
  def create
    @book_suggestion = current_user.book_suggestions.build(book_suggestion_params)

    if @book_suggestion.save
      # Redirect to a 'thank you' page or back to the books list with a success message
      redirect_to books_path, notice: "Your book suggestion has been successfully submitted."
    else
      # If the model fails to save, render the 'new' template again with error messages
      flash.now[:alert] = "There was a problem with your suggestion. Please check the form."
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def book_suggestion_params
      params.require(:book_suggestion).permit(:title, :author, :isbn, :details)
    end
end
