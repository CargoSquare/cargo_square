class Freight < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Association
  belongs_to :order
end
