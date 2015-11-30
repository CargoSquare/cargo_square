class Station < ActiveRecord::Base
  # Association
  has_one :address
  has_one :manager
end
