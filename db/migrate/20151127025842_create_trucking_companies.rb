class CreateTruckingCompanies < ActiveRecord::Migration
  def change
    create_table :trucking_companies do |t|
      t.string :account
      t.integer :settlement_period
      t.string :campany_type

      t.timestamps null: false
    end
  end
end
