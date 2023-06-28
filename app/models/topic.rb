class Topic < ApplicationRecord
  validates :title, :presence => true, :length => { :maximum => 20}
  with_options :length => { :maximum => 20} do
    validates :simplecontent
    validates :date
    validates :content
    validates :price
    validates :bookstatus
  end

  def self.topic_list
    return Topic.all.order(:created_at => :desc)
  end
  
  def self.search(search) #self.はUser.を意味する
    if search
     where(['title LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
     all #全て表示させる
    end
  end
end
