class Client < ActiveRecord::Base
  # Association
  has_one :business_license, as: :company
  has_many :managers
end
