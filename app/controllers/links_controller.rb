class LinksController < ApplicationController
  before_action :require_login

  private
  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/login"
    end
  end
  def show
    render "show"
  end
end
