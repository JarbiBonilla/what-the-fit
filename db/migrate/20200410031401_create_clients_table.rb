class CreateClientsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.float :height
      t.integer :initial_weight
      t.integer :phone_number
      t.string :email
      t.string :gender
      t.integer :current_weight
      t.integer :goal_weight

      t.timestamps
    end
  end
end
