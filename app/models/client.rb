class Client < ApplicationRecord
    before_destroy :destroy_appointments
    has_many :appointments
    has_many :trainers, through: :appointments

    validates :name, presence: true
    validates :age, numericality: true

    private

    def destroy_appointments
        self.appointments.destroy_all
    end

end