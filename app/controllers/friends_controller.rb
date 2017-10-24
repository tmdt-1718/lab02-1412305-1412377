class FriendsController < ApplicationController
    protect_from_forgery with: :null_session

    def index

        @friends = Friend.all
        @users = User.all

        def is_friend(userid1, userid2)
            Friend.exists?(user1: userid1, user2: userid2)
        end
    end

    def create
        @friend = Friend.new(user1: current_user.id,  user2: params[:user2])
        
        if @friend.save
            redirect_to friends_path
        else 
            render :new
        end

    end

    def destroy
        Friend.where(user1: current_user.id,  user2: params[:id]).destroy_all
        redirect_to friends_path
    end
    
    helper_method :is_friend
end
