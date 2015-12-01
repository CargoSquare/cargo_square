class CreateBusinessLicenses < ActiveRecord::Migration
  def change
    create_table :business_licenses do |t|
      t.string :reg_number, null: false
      t.string :company_name, null: false
      t.string :director_name, null: false
      t.string :business_status
      t.string :business_item
      t.integer :business_type

      t.integer :company_id
      t.string :company_type

      t.timestamps null: false
    end
  end
end
