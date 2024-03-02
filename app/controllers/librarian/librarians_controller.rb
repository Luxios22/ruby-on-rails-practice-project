# frozen_string_literal: true

class Librarian::LibrariansController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  authorize_resource class: false

  layout "librarian"

  def index
    @q = User.where(role: User.roles[:librarian]).ransack(params[:q])
    @pagy, @users = pagy(@q.result)

    current_page = params[:page]
    !current_page ? current_page = 1 : current_page = current_page.to_i

    @user_count = @pagy.count
    @user_start = [((current_page - 1) * Pagy::DEFAULT[:items].to_i) + 1, @pagy.count].min
    @user_end = [current_page * Pagy::DEFAULT[:items].to_i, @pagy.count].min
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params.merge(role: :librarian))
    if user.save
      redirect_to librarian_librarians_path, notice: "#{user.username} added as librarian"
    else
      redirect_to librarian_librarians_path, alert: "#{user.username} could not be added as librarian"
    end
  end

  private def user_params
    params.require(:user).permit(:email, :password, :username, :role)
  end

  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: "You are not authorized to access this page."
  end
end
