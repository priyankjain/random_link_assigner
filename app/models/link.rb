class Link < ActiveRecord::Base
    belongs_to :user
    def show
        @link = find_by_user_id(session[:user_id])
    end

    def self.get_available_link
    	Link.where("user_id IS NULL").order("RANDOM()").first
    end
end
