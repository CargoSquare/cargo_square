class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :settlement_period

      t.timestamps null: false
    end
  end
end
