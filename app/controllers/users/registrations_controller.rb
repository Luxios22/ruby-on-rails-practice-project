# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @user = current_user
    if current_user.google_account?
      redirect_to root_path, alert: "You can't edit your profile if you are logged in with Google"
      return
    end
    if current_user.librarian?
      render "edit", layout: "librarian"
    else
      render "edit", layout: "user"
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_to do |format|
        format.html { redirect_to user_path, alert: resource.errors.full_messages }
        format.turbo_stream { flash.now[:alert] = resource.errors.full_messages }
      end
    end
  end

  protected
    def after_update_path_for(resource)
      user_path
    end
end
