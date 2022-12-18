class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)

    if @user.save
      redirect_to '/', notice: "註冊成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(deleted_at: Time.now)
      redirect_to '/', notice: "你已註銷會員"
    end
  end

  private
  def params_user
    params.require(:user).permit(:email, :crypted_password, :crypted_password_confirmation)
  end
end
