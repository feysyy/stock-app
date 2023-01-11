class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == "admin"
      admin_users_path
    else
      root_path
    end
  end
end
