class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user_params[:seller] == 'true' && user_params[:phone].empty?
      flash[:alert] = 'Phone is required as a seller'
      redirect_to signup_path
    elsif user_params[:seller] == 'false' && user_params[:address].empty?
      flash[:alert] = 'Address is required as a buyer'
      redirect_to signup_path
    else
      save_user
    end
  end

  def edit
    @user = User.find(params[:id])
    @ruta = params[:ruta]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      ruta = params[:ruta]
      redirect_to ruta, notice: 'User was successfully updated'
    else
      redirect_to edit_user_path
      flash[:alert] = 'Something went wrong'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :phone, :password, :password_confirmation, :seller, :balance)
  end

  def save_user
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render 'new'
    end
  end
end
