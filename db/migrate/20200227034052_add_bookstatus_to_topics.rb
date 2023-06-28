class AddBookstatusToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :bookstatus, :string
  end
end
