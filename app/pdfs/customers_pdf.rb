class CustomersPdf < Prawn::Document
	def initialize(customers)
		super()

		@customers = customers
	end
end