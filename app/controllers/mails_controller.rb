class MailsController < ApplicationController
    before_action :authorize

    def index
        if params[:status] == nil
            @mails = Usermail.where(from: current_user.id).or(Usermail.where(to: current_user.id)).order(created_at: :desc)
        else
            @mails = Usermail.where(from: current_user.id).order(created_at: :desc)
        end
    end

    def new
        @friends = User.where(id: Friend.where(user1: current_user.id).select("user2"))
    end

    def create
        @mail = Mail.new(subject: params[:subject], content: params[:content])
        if @mail.save
            @id = Mail.last.id
        end
        @receivers = params[:receivers]
        @receivers.each do |receiver|
            Usermail.create(from: current_user.id, to: receiver, mail_id: @id, status: "received", read_at: "")
        end
        redirect_to '/mails'
    end

    def show
    end
end
