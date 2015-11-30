class Freight < ActiveRecord::Base
  # Association
  belongs_to :order
end
