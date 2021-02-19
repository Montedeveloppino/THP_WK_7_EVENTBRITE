class UsersController < ApplicationController


    def edit
        @user = User.find(current_user.id)
        
        
    end

    def show 
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        @user.update(user_params)
        redirect_to 
    end

    private 
    def user_params
        params.require(:user).permit(:fisrt_name, :last_name, :description)
    end 

end
