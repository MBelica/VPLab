class UnlocksController < Devise::UnlocksController

  add_breadcrumb "Home", :root_path

  def new
    add_breadcrumb "User Unlock", :user_acc_unlock_path
    super
  end

end