class Truck < ActiveRecord::Base
  belongs_to :driver, class_name: "TruckDriver", foreign_key: "truck_driver_id"
end
