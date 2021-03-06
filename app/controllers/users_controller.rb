class UsersController < ApplicationController
  before_action :require_logout
  def new
    @user = User.new
  end

  def index
    redirect_to '/register'
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	# User registered, now randomly assign a link
    	available_link = Link.get_available_link  
    	@link_assigned = false  	
    	if available_link # Go ahead and assign the link to the user in case of availability, else skip
    		link_assigned = true
    		available_link.user_id = @user.id
    		available_link.save
    	end 
    	#Continue with registration irrespective of whether a random link was available or not    	
    	UserMailer.welcome_email(@user, link_assigned).deliver_now
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
        redirect_to "/home"
    else
        nil
    end
  end

end
