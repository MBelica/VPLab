class ExperimentsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Experiments", :experiments_path

    @user = current_user
    @experiments = @user.experiments
  end

  def new
    add_breadcrumb "Experiments", :experiments_path
    add_breadcrumb "New", :experiments_new_path
  end

  def edit
    add_breadcrumb "Experiments", :experiments_path
    @experiment = Experiment.find(params[:key])
    add_breadcrumb @experiment.title, :experiments_edit_path
  end

  def enroll

  end

  def confirm

  end
end
