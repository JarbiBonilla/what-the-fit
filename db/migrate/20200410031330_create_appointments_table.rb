class CreateAppointmentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :trainer_id
      t.integer :client_id
      t.boolean :paid_for
      t.integer :price
      
      t.timestamps
    end
  end
end
