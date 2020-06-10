require 'securerandom'

class Trainer < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :clients, through: :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 8 }, presence: true 

    def self.create_with_omniauth(auth)
        trainer = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
        trainer.email = "#{auth['uid']}@#{auth['provider']}.com"
        trainer.password ||= SecureRandom.hex(8)
        trainer.name = auth['info']['name']
        if Trainer.exists?(trainer.id)
          trainer
        else
          trainer.save!
          trainer
        end
      end
end