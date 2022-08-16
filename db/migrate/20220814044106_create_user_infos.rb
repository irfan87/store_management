class CreateUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.string :name
      t.integer :account_number
      t.string :address
      t.integer :postcode
      t.string :region
      t.string :country
      t.string :phone_number
      t.string :second_phone_number
      t.string :outlet_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
