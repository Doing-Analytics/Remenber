class SessionsController < ApplicationController

  def new
    session[:return_to_url] 
    p '======='
    p params
    p session[:return_to_url]
    p params[:next]

    p '======='
  end

  def create
    @user = login(params[:email], params[:crypted_password])
    debugger
    p @user
    p '-----'
    p login(params[:email], params[:crypted_password])
    p '-----'

    if login(params[:email], params[:crypted_password])

      current_user = User.find_by!(email: params[:email])
      session[:current_user_id] = current_user.id
      redirect_to root
    else 
      render :new, status: :unprocessable_entity
    end
  end
end
