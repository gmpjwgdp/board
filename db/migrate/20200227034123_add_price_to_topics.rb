class AddPriceToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :price, :integer
  end
end
