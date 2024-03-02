# frozen_string_literal: true

class UserController < ApplicationController
  layout :custom_layout
  before_action :authenticate_user!
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def show
  end

  def edit
  end

  def custom_layout
    return "turbo_rails/frame" if turbo_frame_request?
    current_user.librarian? ? "librarian" : "user"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
