module ApplicationHelper

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'Please sign in to access this page'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

end