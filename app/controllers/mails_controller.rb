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
        @usermail = Usermail.find_by_mail_id(params[:id])
        @mail = Mail.find(params[:id])

        if @usermail.from == current_user.id
            @receiver = User.find(@usermail.to)
            @sender =  User.find(current_user.id)
        else
            @sender =  User.find(@usermail.from)
            @receiver = User.find(current_user.id)
        end
    end

    def update
        @usermail = Usermail.find_by_mail_id(params[:id])

        @usermail.update_attributes(:status => "read")
        if @usermail.read_at == nil
            @usermail.update(read_at: Time.now().in_time_zone("Hanoi").to_formatted_s(:short))
            @usermail.save
        end
    end
end
