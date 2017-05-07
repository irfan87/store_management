class CustomerPdf < Prawn::Document
	def initialize(customer, store)
		super()
		@customer = customer

		table_store_content
		table_customer_content
	end

	def table_store_content

		bounding_box([100, 700], width: 250, height: 220) do
			text @customer.store.name
			text @customer.store.address
			text @customer.store.province
			text @customer.store.postcode.to_s
			text @customer.store.state
			text @customer.store.phone_number
		end

		move_down 10
	end


	def table_customer_content


		bounding_box([100, 600], width: 250, height: 220) do
			text @customer.name, align: :justify
			text @customer.address, align: :justify
			text @customer.province, align: :justify
			text @customer.postcode.to_s, align: :justify
			text @customer.state, align: :justify
			text @customer.phone_number, align: :justify
		end

		move_down 20
	end
end 