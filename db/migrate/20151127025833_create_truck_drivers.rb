class CreateTruckDrivers < ActiveRecord::Migration
  def change
    create_table :truck_drivers do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number

      t.belongs_to :trucking_company, index: true
      t.timestamps null: false
    end
  end end
