class SessionsController < Devise::SessionsController

  add_breadcrumb "Home", :root_path

  def new
    add_breadcrumb "Log In", :user_login_path
    super
  end

end