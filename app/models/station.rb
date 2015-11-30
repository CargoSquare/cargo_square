class Station < ActiveRecord::Base
  has_one :address
  has_one :manager
end
