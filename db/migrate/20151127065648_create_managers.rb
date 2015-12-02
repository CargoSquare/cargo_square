class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :fax
      t.string :position

      t.belongs_to :client, index: true
      t.belongs_to :station, index: true

      t.timestamps null: false
    end
  end
end
