class Station < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Association
  has_one :address
  has_one :manager
  has_many :orders_source, class_name: "Order", primary_key: "id", foreign_key: "source_id"
  has_many :orders_destination, class_name: "Order", primary_key: "id", foreign_key: "destination_id"
end
