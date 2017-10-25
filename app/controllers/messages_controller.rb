class MessagesController < ApplicationController
  before_action :authorize

  def index
      if params[:status] == nil
          @messages = Usermessage.where(from: current_user.id).or(Usermessage.where(to: current_user.id)).order(created_at: :desc)
      else
          @messages = Usermessage.where(from: current_user.id).order(created_at: :desc)
      end
  end

  def new
      @friends = User.where(id: Friend.where(user1: current_user.id).select("user2"))
  end

  def create
      @message = Message.new(subject: params[:subject], content: params[:content])
      if @message.save
          @id = Message.last.id
      end
      @receivers = params[:receivers]
      @receivers.each do |receiver|
          Usermessage.create(from: current_user.id, to: receiver, message_id: @id, status: "received", read_at: "")
      end
      redirect_to '/messages'
  end

  def show
      @usermessage = Usermessage.find_by_message_id(params[:id])
      @message = Message.find(params[:id])

      if @usermessage.from == current_user.id
          @receiver = User.find(@usermessage.to)
          @sender =  User.find(current_user.id)
      else
          @sender =  User.find(@usermessage.from)
          @receiver = User.find(current_user.id)
      end
  end

  def update
      @usermessage = Usermessage.find_by_message_id(params[:id])

      @usermessage.update_attributes(:status => "read")
      if @usermessage.read_at == nil
          @usermessage.update(read_at: Time.now().in_time_zone("Hanoi").to_formatted_s(:short))
          @usermessage.save
      end
  end
end
