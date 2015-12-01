class Station < ActiveRecord::Base
  # Audited
  audited
  # Association
  has_one :address
  has_one :manager
end
