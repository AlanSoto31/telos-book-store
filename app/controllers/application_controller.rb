class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !current_user.nil?
  end

  def user_must_be_logged_in
    redirect_to login_path, alert: 'You must be logged in' if current_user.nil?
  end

  def user_must_be_seller
    redirect_to login_path, alert: 'You must be logged in as seller' if current_user.nil?
    if !current_user.nil? && current_user.seller == false
      redirect_to edit_user_path(current_user.id), alert: 'You must update your account as a seller' 
    end
  end
  
end
