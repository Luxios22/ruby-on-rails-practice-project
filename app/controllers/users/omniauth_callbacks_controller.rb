# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.find_oauth(auth)
    if user.present?
      flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = "An account with that email already exists. Please sign in with your password."
      redirect_to new_user_session_path
    end
  end

  private
    def auth
      @auth ||= request.env["omniauth.auth"]
    end
end
