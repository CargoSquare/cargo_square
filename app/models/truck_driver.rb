class TruckDriver < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Acts As Commentable
  acts_as_commentable
  # Callbacks
  before_save :remove_useless_character

  # Validation
  validates :name, presence: true
  validates :phone_number, format: {with: /[0-9]+/, :message => "Invalid phone_number format"}
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Invalid email format"}
  # Association
  belongs_to :company, class_name: "TruckingCompany", foreign_key: "trucking_company_id"
  has_one :truck
  # Custom Modules
  include PhoneNumberHandler

  # Customized reader and writer for phone_number
  def phone_number
    if self[:phone_number] == nil
      return nil
    end
    phone_number = self[:phone_number]
    return PhoneNumberHandler.format_phone_number(phone_number)
  end
  def phone_number=(num)
    self[:phone_number] = PhoneNumberHandler.pure_phone_number(num)
  end

  private
  def remove_useless_character
    driver = self
    if driver.email != nil
      driver.email.gsub!(/[\s]/, '')
    end
  end
end
