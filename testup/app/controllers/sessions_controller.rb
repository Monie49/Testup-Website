class SessionsController < ApplicationController

  def new
  end

  def create
    curr_user = User.find_by(email: params[:session][:email].downcase)
    if curr_user && curr_user.authenticate(params[:session][:password])
      sign_in curr_user
      redirect_to curr_user
    else
      flash.now[:danger] = 'Email, Password, or both are incorrect'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
