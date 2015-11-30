class Manager < ActiveRecord::Base
  belongs_to :client
  belongs_to :station
  belongs_to :order
end
