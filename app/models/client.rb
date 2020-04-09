class Client < ActiveRecord::Base
    has_many :appointments
    has_many :trainers, through: :appointments
end