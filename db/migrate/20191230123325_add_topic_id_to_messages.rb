class AddTopicIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :topic_id, :string
  end
end
