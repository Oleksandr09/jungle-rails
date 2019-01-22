class User < ActiveRecord::Base
    has_secure_password
    
    validates :password, :password_confirmation, presence: true, length: {minimum: 8}
 
    validates :email, uniqueness: true
    has_many :reviews

    def self.authenticate_with_credentials(email, password) 
       @user = User.find_by_email(email)
        if @user.authenticate(password)
            @user
        else
            nil
        end
    end
end
