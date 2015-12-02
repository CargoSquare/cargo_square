class Manager < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Acts As Commentable
  acts_as_commentable
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :phone_number, format: { with: /[0-9]+/, :message => "Invalid phone_number format"}, :allow_blank => true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Invalid email format"}, :allow_blank => true
  # Association
  belongs_to :client
  belongs_to :station
  belongs_to :order
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
    manager = self
    if manager.email != nil
      manager.email.gsub!(/[\s]/, '')
    end
    if manager.fax != nil
      manager.fax.gsub!(/[\s]/, '')
    end
    if manager.name != nil
      manager.name.gsub!(/[\s]/, '')
    end
  end
end
