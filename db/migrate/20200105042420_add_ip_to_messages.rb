class AddIpToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :ip, :string
  end
end
