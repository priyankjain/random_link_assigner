class UsersController < ApplicationController
  before_action :require_logout
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	# User registered, now randomly assign a link
    	available_link = Link.get_available_link    	
    	if available_link # Go ahead and assign the link to the user in case of availability, else skip
    		available_link.user_id = @user.id
    		available_link.save
    		# TO-DO: Code to notify of link assignment
    	end 
    	#Continue with registration irrespective of whether a random link was available or not    	
        redirect_to "/login", :notice => 'Registered successfully!'
    else
        render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private
  def require_logout
    if !current_user.nil?
        redirect_to "/login"
    else
        nil
    end
  end

end
