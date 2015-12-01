class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :number, null: false
      t.integer :category, null: false
      t.float  :size, null: false
      t.float   :width
      t.float   :depth
      t.float   :height

      t.belongs_to :truck_driver, index: true
      t.timestamps null: false
    end
  end
end
