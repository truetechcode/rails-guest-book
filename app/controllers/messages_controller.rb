class MessagesController < ApplicationController
  before_action :set_message, :logged_in_user, only: [:show, :edit, :update, :destroy]
  # GET /messages
  # GET /messages.json
  def index
    
    if logged_in?
    if params[:filter].blank?
      @messages = Message.order("created_at DESC")
      # p @messages
    else
      my_ip = request.remote_ip
      @messages = Message.by_ip_address(my_ip).all
    end
  else
    if params[:filter].blank?
      @messages = Message.where(hidden: false).order("created_at DESC")
      # p @messages
    else
      my_ip = request.remote_ip
      @messages = Message.where(hidden: false).by_ip_address(my_ip).all
    end
  end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.ip_address = request.remote_ip

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @message.hidden = params[:hidden]
    # p @message.errors.messages
    if @message.save
      redirect_to messages_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def by_ip_address (ip)
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :entry, :ip_address, :hidden)
    end

    def update_message_params
      params.require(:message).permit(:hidden)
    end    
end
