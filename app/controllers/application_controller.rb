# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_up_search_instance

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email])
    end

    def after_sign_in_path_for(resource)
      if resource.librarian?
        librarian_books_path
      else
        books_path
      end
    end

  private
    def set_up_search_instance
      @q = Book.with_attached_cover.ransack(params[:q])
    end
end
