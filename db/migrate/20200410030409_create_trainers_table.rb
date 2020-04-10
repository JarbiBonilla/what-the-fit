class CreateTrainersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio
    end
  end
end
