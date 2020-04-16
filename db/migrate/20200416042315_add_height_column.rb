class AddHeightColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :height, :integer
  end
end
