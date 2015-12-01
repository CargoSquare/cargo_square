class Client < ActiveRecord::Base
  # Audited
  audited
  # Association
  has_one :business_license, as: :company
  has_many :managers
end
