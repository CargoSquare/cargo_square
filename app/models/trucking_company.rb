class TruckingCompany < ActiveRecord::Base
  has_many :truck_drivers
  has_many :trucks, through: :truck_drivers
  has_one :back_account
end
