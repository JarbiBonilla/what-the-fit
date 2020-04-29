class Client < ApplicationRecord
    has_many :appointments
    has_many :trainers, through: :appointments

    validates :name, presence: true
    validates :age, numericality: true

end