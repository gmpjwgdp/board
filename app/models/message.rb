class Message < ActiveRecord::Base
  validates :title, :presence => true, :length => { :maximum => 10 }
  validates :body, :presence => true, :length => { :maximum => 100 , :minimum => 1}

  def self.message_list
    # return Message.all.order(:created_at => :desc)
    return Message.all.order(:created_at => :desc)
    
  end
end