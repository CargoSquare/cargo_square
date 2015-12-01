class Truck < ActiveRecord::Base
  # Audited
  audited
  # Truck Category
  @categories = ["일반", "윙", "탑"]
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :number, :category, :size, presence: true
  validates :category, inclusion: {in: @categories }
  # Association
  belongs_to :driver, class_name: "TruckDriver", foreign_key: "truck_driver_id"

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
