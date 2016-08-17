class SessionsController < ApplicationController
  def new
  end

  def create
    if !current_user.nil?
        redirect_to "/home"
    else
        user = User.authenticate(params[:email], params[:password])
        if user
            session[:user_id] = user.id
            redirect_to '/home', :notice => "Successfully logged in"
        else
            flash.now.alert = "Invalid credentials"
            render "new"
        end
    end
  end
    
  def destroy
    session[:user_id] = nil
    redirect_to '/login', :notice => "Logged out!"
  end
end
