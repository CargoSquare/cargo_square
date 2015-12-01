class BusinessLicense < ActiveRecord::Base
  # Audited
  audited
  # Business Types
  def self.business_types
   return ["개인", "법인"]
  end
  # Callbacks
  before_save :remove_useless_character
  # Validation
  validates :reg_number, :company_name, :director_name, :company_type, presence: true
  validates :business_type, inclusion: {in: (0...BusinessLicense.business_types.count).to_a }
  # Association
  belongs_to :company, polymorphic: true
  has_one :address

  # Customized reader and writer for business_type
  def business_type
    if self[:business_type] == nil
      return nil
    end
    return BusinessLicense.business_types[self[:business_type]]
  end
  def business_type=(type)
    business_types = BusinessLicense.business_types
    if business_types.include?(type)
      self[:business_type] = business_types.index(type)
    else
      errors.add(:base, "Invalid business type... \n
                 BusinessType must be one of " + business_types.to_s)
      raise "Invalid business type..."
    end
  end

  private
  def remove_useless_character
    license = self
    if license.reg_number != nil
      license.reg_number.gsub!(/[\s-]/, '')
    end
  end
end
