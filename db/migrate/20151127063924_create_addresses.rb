class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.string :new_address
      t.string :old_address
      t.string :detail_address
      t.string :english_address

      t.belongs_to :business_license, index: true
      t.belongs_to :station, index: true

      t.timestamps null: false
    end
  end
end
