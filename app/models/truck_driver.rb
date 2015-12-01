class TruckDriver < ActiveRecord::Base
  # Callbacks
  before_save :remove_useless_character

  # Validation
  validates :name, presence: true
  # Association
  belongs_to :company, class_name: "TruckingCompany", foreign_key: "trucking_company_id"
  has_one :truck

  def formatted_phone_number
    # TODO
    # return full formatted phonenumber
  end

  private
  def remove_useless_character
    driver = self
    if driver.phone_number != nil
      driver.phone_number.gsub!(/[^0-9\s]/, '')
    end
    if driver.email != nil
      driver.email.gsub!(/[\s]/, '')
    end
  end
end
