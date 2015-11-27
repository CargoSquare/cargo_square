class TruckDriver < ActiveRecord::Base
  belongs_to :trucking_company
  has_one :truck
end
