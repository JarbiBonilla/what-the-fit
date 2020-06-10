class Client < ApplicationRecord

    has_many :appointments, dependent: :destroy
    has_many :trainers, through: :appointments
    
    accepts_nested_attributes_for :appointments 

    scope :ordered_by_name, -> { order(name: :asc) }
    scope :client_name, -> (name) {where("name like ?", "%#{name}%")}

    validates :name, presence: true
    validates :age, numericality: true
    validates :initial_weight, presence: true
    validates :phone_number, presence: true
    validates :phone_number, length: { is: 10 }
    validates :email, presence: true, uniqueness: true 
    validates :gender, presence: true
    validates :current_weight, presence: true
    validates :goal_weight, presence: true 
    validates :height, presence: true 

end