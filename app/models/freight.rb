class Freight < ActiveRecord::Base
  # Audited
  audited
  # Association
  belongs_to :order
end
