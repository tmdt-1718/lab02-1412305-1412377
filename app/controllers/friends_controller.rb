class FriendsController < ApplicationController
    def index
        @friends = Friend.all
        @users = User.all
        def is_friend(userid1, userid2)
            Friend.exists?(user1: userid1, user2: userid2)
        end
    end
    helper_method :is_friend
end
