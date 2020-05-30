class AddColumnsToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :provider, :string
    add_column :trainers, :uid, :string
  end
end
