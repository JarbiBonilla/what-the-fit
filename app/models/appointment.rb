class Appointment < ApplicationRecord
    belongs_to :trainer
    belongs_to :client

    validates :appointment_time, presence: true
    validates :price, presence: true
end