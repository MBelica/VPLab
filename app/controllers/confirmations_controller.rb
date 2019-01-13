class ConfirmationsController < Devise::ConfirmationsController

  add_breadcrumb "Home", :root_path

  def new
    add_breadcrumb "User Confirmation", :user_acc_confirmation_path
    super
  end

end