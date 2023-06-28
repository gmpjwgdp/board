class AddTagToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :tag, :string
  end
end
