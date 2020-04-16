class DeleteHeightColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :height, :float
  end
end
