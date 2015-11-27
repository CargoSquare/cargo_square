class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :truck_number, null: false
      t.string :truck_type, null: false
      t.float  :truck_size, null: false
      t.float   :truck_width
      t.float   :truck_depth
      t.float   :truck_height

      t.belongs_to :truck_driver, index: true
      t.timestamps null: false
    end
  end
end
