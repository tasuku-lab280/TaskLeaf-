class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました。"
      redirect_to root_url
    else  
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
