class Customer < ApplicationRecord
	validates :name, presence: true
	validates :address, presence: true
	validates :postcode, presence: true, numericality: {only_integer: true}
	validates :province, presence: true
	validates :state, presence: true
	validates :phone_number, presence: true, numericality: {only_integer: true}

	belongs_to :store
end
