class Order < ActiveRecord::Base
  has_one :source, :class_name => "Station", :foreign_key => "source_id"
  has_one :destination, :class_name => "Station", :foreign_key => "destination_id"
  has_one :truck_driver
  has_one :manager
  has_many :freight
end
