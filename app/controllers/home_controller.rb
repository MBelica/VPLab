class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :redirect_on_logged_in, :only => [:index]

  add_breadcrumb "Home", :root_path

  def index

  end

  def dashboard

  end

  private

  def redirect_on_logged_in
    redirect_to dashboard_path if current_user
  end
end
