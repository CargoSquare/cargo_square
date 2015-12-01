class Order < ActiveRecord::Base
  # Audited
  audited
  # Statuses
  @statuses = ["오더등록", "배차완료", "픽업완료", "하차완료", "마감완료"]
  # Validation
  validates :status, inclusion: {in: [0, 1, 2, 3, 4]}
  # Association
  has_one :source, :class_name => "Station", :foreign_key => "source_id"
  has_one :destination, :class_name => "Station", :foreign_key => "destination_id"
  has_one :truck_driver
  has_one :manager
  has_many :freight

  def formatted_status
    order = self
    if order.status != nil and order.status < 5
      return @statuses[order.status]
    else
      return "Error in status"
    end
  end
end
