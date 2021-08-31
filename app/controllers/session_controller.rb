class SessionController < ApplicationController
  before_action :update_availability_books, only: [:destroy]

  def new
    @ruta = params[:ruta]
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      @ruta = params[:ruta]
      redirect_to @ruta, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    current_cart.destroy
    render_index_real_time
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
