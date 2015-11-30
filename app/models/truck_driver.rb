class TruckDriver < ActiveRecord::Base
  belongs_to :company, class_name: "TruckingCompany", foreign_key: "trucking_company_id"
  has_one :truck
end
