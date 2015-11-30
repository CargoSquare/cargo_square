class BusinessLicense < ActiveRecord::Base
  # Callbacks
  before_save :remove_whitespace

  # Validation
  validates :reg_number, :company_name, :director_name, presence: true

  # Association
  belongs_to :company, polymorphic: true
  has_one :address

  private
  def remove_whitespace(license)
    if license.reg_number != nil
      license.reg_number = license.reg_number.delete(' ').delete('-')
    end
  end
end
