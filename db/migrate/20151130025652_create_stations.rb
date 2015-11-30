class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :company_name

      t.timestamps null: false
    end
  end
end
