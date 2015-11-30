class CreateFreights < ActiveRecord::Migration
  def change
    create_table :freights do |t|
      t.integer :weight
      t.integer :quantity
      t.text :description

      t.belongs_to :order, index: true

      t.timestamps null: false
    end
  end
end
