class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user_params[:seller] == 'true' && user_params[:phone].empty?
      flash.now[:alert] = 'Phone is required to seller'
      render :new
    elsif user_params[:seller] == 'false' && user_params[:address].empty?
      flash.now[:alert] = 'Address is required to seller'
      render :new
    else
      save_user
    end
  end

  def edit
    @user = current_user
  end
  

  def update
    @user = current_user
    if @user.update(user_params)
      @user.seller = true
      redirect_to new_book_path, notice: 'User was successfully updated'
    else
      redirect_to edit_user_path
      flash.now[:alert] = "Something went wrong"
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :phone, :password, :password_confirmation, :seller)
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
