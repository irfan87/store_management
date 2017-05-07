class Store < ApplicationRecord
	validates :name, presence: true
	validates :address, presence: true
	validates :postcode, presence: true
	validates :province, presence: true
	validates :state, presence: true
	validates :phone_number, presence: true
	validates :postcode, numericality: {only_integer: true}
	validates :phone_number, numericality: {only_integer: true}, length: {maximum: 10, minimum: 3}

	has_many :customers
end
