class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(allowed_params)
           
        if @user.save
            redirect_to login_path
        else 
            render :new
        end
 
    end

    def allowed_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
