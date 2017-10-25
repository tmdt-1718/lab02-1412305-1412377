class UsersController < ApplicationController  
    def new
        @user = User.new
    end

    def create
        @user = User.new(allowed_params)
        if User.exists?(email: @user.email)
          flash[:danger] = 'Email already taken!'
          render :new
        else
          if @user.save
            redirect_to login_path
          else
            render :new
          end
        end
    end

    def allowed_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
