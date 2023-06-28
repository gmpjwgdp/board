class AddSideToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :side, :string
  end
end
