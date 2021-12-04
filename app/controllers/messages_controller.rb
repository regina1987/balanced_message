class MessagesController < ApplicationController
  def index
    @msg = Message.last(10).reverse
  end

  def new
    @msg = Message.new
  end

  def create
    @msg = Message.create msg_params
    @msg.result = MessageHelper.check_message(params[:message][:text_message])
    @msg.save
    redirect_to messages_index_path, notice: "Tu mensaje #{@msg.text_message} es #{@msg.result ? 'balanceado' : 'desbalanceado'} "
  end

  private

  def msg_params
    params.require(:message).permit(:text_message, :result)
  end
end
