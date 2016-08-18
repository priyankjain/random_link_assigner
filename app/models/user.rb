class User < ActiveRecord::Base
    has_one :link, :dependent => :nullify
    attr_accessor :password
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :on => :create
    validates_format_of :password, with: /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$\z/i, :on => :create, :message => "should be minimum 8 characters, containing atleast one uppercase letter, one lowercase letter and a digit"
    validates_format_of :name, with: /\A[A-Za-z][A-Za-z\'\ \-]*\z/i, :on => :create, :message => "can contain only alphabets and apostrophe"

    before_save :encrypt_password

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end
    
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end        
end
