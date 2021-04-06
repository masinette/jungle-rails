class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    # puts user.inspect
    if user
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to '/login'
    end
  end
end
