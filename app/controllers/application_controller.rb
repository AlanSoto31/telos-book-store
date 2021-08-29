class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :current_cart

  def current_cart
    cart = Cart.find_by(user_id: session[:user_id])
    cart ? cart : Cart.create(user_id: session[:user_id])
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !current_user.nil?
  end

  def user_must_be_logged_in
    redirect_to login_path, alert: 'You must be logged in' if current_user.nil?
  end

  def user_must_be_seller(ruta = root_path)
    redirect_to login_path(ruta: ruta), alert: 'You must be logged in as seller' if current_user.nil?
    return unless !current_user.nil? && current_user.seller == false && current_user.phone.empty?

    redirect_to edit_user_path(current_user.id, ruta: ruta), alert: 'You must update your account as a seller'
  end

  def user_must_be_buyer(ruta = root_path)
    redirect_to login_path(ruta: ruta), alert: 'You must be logged in as buyer' if current_user.nil?
    return unless !current_user.nil? && current_user.seller == true && current_user.address.empty?

    redirect_to edit_user_path(current_user.id, ruta: ruta), alert: 'You must register your address'
  end

end
