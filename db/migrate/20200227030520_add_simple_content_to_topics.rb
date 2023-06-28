class AddSimpleContentToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :status, :string
  end
end
