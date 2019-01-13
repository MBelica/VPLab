class PasswordsController < Devise::PasswordsController

  add_breadcrumb "Home", :root_path

  # GET /resource/password/new
  def new
    add_breadcrumb "Reset Password", :reset_password_path
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    add_breadcrumb "Update Password", :update_password_path
    super
  end

end