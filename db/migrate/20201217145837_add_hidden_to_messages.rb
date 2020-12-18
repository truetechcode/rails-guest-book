class AddHiddenToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :hidden, :boolean
  end
end
