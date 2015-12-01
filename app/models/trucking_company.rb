class TruckingCompany < ActiveRecord::Base
  # Audited
  audited
  # Association
  has_many :drivers, class_name: "TruckDriver", primary_key: "id", foreign_key: "trucking_company_id"
  has_many :trucks, through: :truck_drivers
  has_one :bank_account
  has_one :business_license, as: :company
end
