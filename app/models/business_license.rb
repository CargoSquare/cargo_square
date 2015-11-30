class BusinessLicense < ActiveRecord::Base
  belongs_to :company, polymorphic: true
  has_one :address
end
