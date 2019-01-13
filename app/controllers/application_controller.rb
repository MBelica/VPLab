class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :firstname, :lastname, :matrikel, :gender, :birthday, :country_name, :begin_study, :langDE, :langEN, :study_id, :degree_id, :terms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:secondary_email, :gender, :birthday, :country_name, :begin_study, :langDE, :langEN, :study_id, :degree_id])
  end
end
