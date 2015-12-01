class BusinessLicense < ActiveRecord::Base
  # Audited
  audited
  # Company Types
  def self.compnay_types
   return ["개인", "법인"]
  end
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :reg_number, :company_name, :director_name, :company_type, presence: true
  validates :company_type, inclusion: {in: self.company_types }
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
