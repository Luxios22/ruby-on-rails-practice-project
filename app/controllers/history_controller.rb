# frozen_string_literal: true

class HistoryController < ApplicationController
  layout "user"
  before_action :authenticate_user!
  def show
    @history = current_user.user_activities.order(updated_at: :desc)
  end
end
