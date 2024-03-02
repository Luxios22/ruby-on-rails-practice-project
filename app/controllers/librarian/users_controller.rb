# frozen_string_literal: true

class Librarian::UsersController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  authorize_resource class: false

  layout "librarian"

  def index
    @q = User.where(role: User.roles[:regular]).ransack(params[:q])
    @pagy, @users = pagy(@q.result)

    current_page = params[:page]
    !current_page ? current_page = 1 : current_page = current_page.to_i

    @user_count = @pagy.count
    @user_start = [((current_page - 1) * Pagy::DEFAULT[:items].to_i) + 1, @pagy.count].min
    @user_end = [current_page * Pagy::DEFAULT[:items].to_i, @pagy.count].min
  end

  def show
    @user = User.find(params[:id])
  end
end
