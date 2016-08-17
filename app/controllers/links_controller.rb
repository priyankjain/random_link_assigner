class LinksController < ApplicationController
  before_action :require_login

  def show
  	@link = Link.find_by_user_id(session[:user_id])  		
  end

  private
  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/login"
    end
  end

end
