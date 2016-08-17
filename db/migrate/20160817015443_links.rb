class Links < ActiveRecord::Migration
    def self.up
        Link.create :url => "http://facebook.com"
        Link.create :url => "http://google.com"
        Link.create :url => "http://amazon.com"
        Link.create :url => "http://youtube.com"
        Link.create :url => "http://twitter.com"
        Link.create :url => "http://samsung.com"
    end
end
