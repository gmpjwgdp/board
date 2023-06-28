class TopicsController < ApplicationController
  # 表示
  def index
    @cnt = 0
    @cnt_2 = 0
    @page_title = 'oguちゃんねる'
    if params[:tag]
      @topics = Topic.where(tag: params[:tag]).topic_list.page(params[:page]).per(5).search(params[:search])
    else
      @topics = Topic.topic_list.page(params[:page]).per(5).search(params[:search])
    end
    @topics_circle = Topic.where(tag: "サークル・部活").topic_list.page(params[:circle]).per(5).search(params[:search])
    @topics_books = Topic.where(tag: "参考書譲渡").topic_list.page(params[:books]).per(5).search(params[:search])
    @topic = Topic.new
  end

  # 書き込み
  def create
    @topic = Topic.new(params.require(:topic).permit(:title,:tag,:simplecontent,:date,:content,:price,:bookstatus,:side))
    if @topic.save
      # redirect_to :action => :index
      redirect_to "/topics/#{@topic.id}/messages/index"
    else
      # @topics = Topic.topic_list
      redirect_to "/"
      flash[:danger] = 'スレッドの作成に失敗しました🐧'
    end
  end
  def update
    super
    redirect_to :back
  end
  # def search
  #   #Viewのformで取得したパラメータをモデルに渡す
  #   @topics = Topic.search(params[:search])
  #   redirect_to "/topics/0/messages/index"
  # end
end
