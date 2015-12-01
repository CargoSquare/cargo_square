class Manager < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :phone_number, format: { with: /[0-9]+/, :message => "Invalid phone_number foramt"}
  # Association
  belongs_to :client
  belongs_to :station
  belongs_to :order

  def formatted_phone_number
    # TODO
    # return full formatted phonenumber
  end

  private
  def remove_useless_character
    manager = self
    if manager.phone_number != nil
      manager.phone_number.gsub!(/[^0-9\s]/, '')
    end
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
