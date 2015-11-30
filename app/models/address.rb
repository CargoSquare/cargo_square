class Address < ActiveRecord::Base
  belongs_to :business_license
  belongs_to :station
end
