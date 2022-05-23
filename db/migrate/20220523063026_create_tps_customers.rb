class CreateTpsCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :tps_customers do |t|
      t.integer :user_type
      t.string :full_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
