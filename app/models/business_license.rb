class BusinessLicense < ActiveRecord::Base
  # Company Types
  @company_types = ["개인", "법인"]
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :reg_number, :company_name, :director_name, :company_type, presence: true
  validates :company_type, inclusion: {in: @company_types }
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
