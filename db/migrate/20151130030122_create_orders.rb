class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :company_name
      t.datetime :pickup_duedate
      t.datetime :dropoff_duedate
      t.integer :sales
      t.integer :purchase
      t.text :etc

      t.integer :source_id, index: true
      t.integer :destination_id, index: true
      t.integer :truck_driver_id, index: true

      t.timestamps null: false
    end
  end
end
