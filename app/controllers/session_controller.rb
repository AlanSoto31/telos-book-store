class SessionController < ApplicationController
  def new
    @ruta = params[:ruta]
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      @ruta = params[:ruta]
      if @ruta.nil?
        (redirect_to root_path,
                     notice: 'Logged in successfully')
      else
        (redirect_to @ruta,
                     notice: 'Logged in successfully')
      end
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
