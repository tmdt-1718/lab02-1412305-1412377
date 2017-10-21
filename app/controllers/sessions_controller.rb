class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to '/mails'
        end
    end
    
    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to '/mails'
        else
          flash[:danger] = 'Invalid username or password'
          redirect_to '/login'
        end
      end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: 'Logged out!'
    end

end
