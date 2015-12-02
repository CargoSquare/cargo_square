class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.datetime :pickup_duedate
      t.datetime :dropoff_duedate
      t.integer :sales
      t.integer :purchase
      t.float   :truck_size
      t.text    :etc

      t.integer :order_manager_id, index: true
      t.integer :charge_manager_id, index: true
      t.integer :freight_manager_id, index: true
      
      t.integer :source_id, index: true
      t.integer :destination_id, index: true
      t.integer :truck_driver_id, index: true

      t.timestamps null: false
    end
  end
end
