class Order < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Acts As Commentable
  acts_as_commentable
  # Statuses
  def self.statuses
    return ["대기중", "배차중", "이동중", "상차중", "운송중", "하차중", "운송완료", "마감완료"]
  end
  # Validation
  validates :status, inclusion: {in: Order.statuses}
  # Association
  belongs_to :order_manager, class_name: "Manager", foreign_key: "order_manager_id"
  belongs_to :charge_manager, class_name: "Manager", foreign_key: "charge_manager_id"
  belongs_to :freight_manager, class_name: "Manager", foreign_key: "freight_manager_id"
  belongs_to :source, class_name: "Station", foreign_key: "source_id"
  belongs_to :destination, class_name: "Station", foreign_key: "destination_id"
  has_one :truck_driver
  has_many :freights

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

  # Customized reader and writer for manager
  def manager
    return self.order_manager
  end
  def manager=(manager)
    self.order_manager = manager
    self.charge_manager ||= manager
    self.freight_manager ||= manager
  end

  # Status History
  def status_info
    # Init info hash
    info = {}
    Order.statuses.each_with_index do |stat, i|
      if i == 0
        info[i] = self.created_at
      else 
        info[i] = nil
      end
    end

    # Iterate audits
    current_status_index = 0
    self.audits.each do |audit|
      changes = audit.audited_changes["status"]
      if changes != nil and changes.kind_of?(Array)
        if changes.count > 1
          from = changes[0]
          to = changes[1]
          current_status_index = to

          # If status jumps.. ex) from 1 to 4
          ((from+1)..to).each do |i|
            info[i] = audit.created_at
          end
        end
      end
    end

    # Remove Useless data
    ((current_status_index+1)...(Order.statuses.count)).each do |i|
      info[i] = nil
    end
    
    return info
  end
end
