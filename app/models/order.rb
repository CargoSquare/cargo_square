class Order < ActiveRecord::Base
  private
  cattr_accessor :statuses
  # Audited
  audited
  # Statuses
  def self.statuses
    return ["오더입력", "오더등록", "배차완료", "픽업완료", "하차완료", "마감완료"]
  end
  # Validation
  validates :status, inclusion: {in: (0...Order.statuses.count).to_a}
  # Association
  belongs_to :source, class_name: "Station", foreign_key: "source_id"
  belongs_to :destination, class_name: "Station", foreign_key: "destination_id"
  has_one :truck_driver
  has_one :manager
  has_many :freight

  # Customized reader and writer for status
  def status
    if self[:status] == nil
      return nil
    end
    return Order.statuses[self[:status]]
  end
  def status=(stat)
    statuses = Order.statuses
    if statuses.include?(stat)
      self[:status] = statuses.index(stat)
    else
      errors.add(:base, "Invalid order status... \n
                 Status must be one of " + statuses.to_s)
      raise "Invalid order status..."
    end
  end 

  # Status History
  def status_info
    
  end
end
