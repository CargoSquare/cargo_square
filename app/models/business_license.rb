class BusinessLicense < ActiveRecord::Base
  # Callbacks
  before_save :remove_useless_character

  # Validation
  validates :reg_number, :company_name, :director_name, presence: true

  # Association
  belongs_to :company, polymorphic: true
  has_one :address

  private
  def remove_useless_character
    license = self
    if license.reg_number != nil
      license.reg_number.gsub!(/[\s-]/, '')
    end
  end
end
