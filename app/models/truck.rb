class Truck < ActiveRecord::Base
  # Audited
  audited
  # Truck Category
  def self.categories
    return ["일반", "윙", "탑"]
  end
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :number, :category, :size, presence: true
  validates :category, inclusion: {in: Truck.categories}
  # Association
  belongs_to :driver, class_name: "TruckDriver", foreign_key: "truck_driver_id"

  # Customized reader and writer for category
  def category
    if self[:category] == nil
      return nil
    end
    return Truck.categories[self[:category]]
  end
  def category=(cat)
    categories = Truck.categories
    if categories.include?(cat)
      self[:category] = categories.index(cat)
    else
      errors.add(:base, "Invalid truck category... \n
                 Category must be one of " + categories.to_s)
      raise "Invalid truck category"
    end
  end

  private
  def remove_useless_character
    truck = self
    if truck.number != nil
      truck.number.gsub!(/[\s]/, '')
    end
    if truck.category != nil
      truck.category.gsub!(/[\s]/, '')
    end
  end
end
