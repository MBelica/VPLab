class AdminController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'Home', :root_path
  add_breadcrumb 'Administration', :admin_path

  def index

  end

  def new
    add_breadcrumb 'New User', :admin_users_new_path

  end

  def create
    @user = User.new(user_params)
  end

  def users
    add_breadcrumb 'Users', :admin_users_path

    @users = User
  end

  def edit
    add_breadcrumb 'Users', :admin_users_path

    @user = User.find(params[:key])

    add_breadcrumb (@user.firstname + ' ' + @user.lastname), :admin_users_edit_path
  end

  def update
    add_breadcrumb 'Users', :admin_users_path

    @user = User.find(params[:key])

    add_breadcrumb (@user.firstname + ' ' + @user.lastname), :admin_users_edit_path

    if @user.update_attributes(user_params)
      flash[:notice] = 'Update successful'
    else
      flash[:error] = 'Update failed'
    end
    redirect_to :admin_users_edit
  end

  private

  def user_params
    params.require(:user).permit(:lastname)
  end
end
