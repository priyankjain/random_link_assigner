class Link < ActiveRecord::Base
    belongs_to :user    

    def self.get_available_link
    	Link.where("user_id IS NULL").order("RANDOM()").first
    end
end
