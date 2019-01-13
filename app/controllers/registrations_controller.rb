class RegistrationsController < Devise::RegistrationsController

  add_breadcrumb "Home", :root_path

  def new
    add_breadcrumb "Signup", :user_signup_path
    super
  end

  def edit
    add_breadcrumb "Profile", :user_edit_path
    super
  end

end