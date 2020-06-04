class Appointment < ApplicationRecord
    belongs_to :trainer, optional: true 
    belongs_to :client, optional: true

    validates :appointment_time, presence: true
    validates :price, presence: true
end