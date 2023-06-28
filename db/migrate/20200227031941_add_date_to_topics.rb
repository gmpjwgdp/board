class AddDateToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :date, :string
  end
end
