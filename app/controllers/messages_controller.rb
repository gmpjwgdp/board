class MessagesController < ApplicationController

  # 表示
  def index
    @page_title = 'oguちゃんねる'
    @topic = Topic.find_by(id: params[:id])
    # @messages = Message.message_list
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    @message = Message.new(:topic_id => params[:id],:ip => remote_ip)
    # @topic = Topic.find(params[:id])
    @messages = Message.where(topic_id: params[:id]).message_list.page(params[:page])
    @count = @messages.length + 1
    
    @tweet_url = URI.encode(
      "http://twitter.com/intent/tweet?original_referer=" +
      request.url +
      "&url=" +
      request.url +
      "&text=" +
      "OGUBBSで『" + @topic.title + "』のスレッドを見よう！。" 
    )
  end

  # 書き込み
  def create
    @message = Message.new(params.require(:message).permit(:title, :body, :topic_id,:ip))
    if @message.save
      redirect_to "/topics/#{@message.topic_id}/messages/index"
    else
      @messages = Message.where(topic_id: params[:id]).message_list
      # render :index
      redirect_to "/topics/#{@message.topic_id}/messages/index"
      flash[:danger] = 'レスポンスの作成に失敗しました'
    end
  end

end
