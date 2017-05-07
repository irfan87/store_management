class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.integer :postcode
      t.string :province
      t.string :state
      t.string :phone_number

      t.timestamps
    end
  end
end
