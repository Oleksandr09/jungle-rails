class UsersController < ApplicationController

    def show
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to [:products]
        else 
            redirect_to [:user]
        end
    end
end

private  

def user_params
    params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation
)
end