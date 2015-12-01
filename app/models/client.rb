class Client < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Association
  has_one :business_license, as: :company
  has_many :managers
end
