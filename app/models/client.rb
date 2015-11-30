class Client < ActiveRecord::Base
  has_one :business_license, as: :company
  has_many :managers
end
