class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :uid
      t.boolean :active

      t.timestamps
    end
  end
end
