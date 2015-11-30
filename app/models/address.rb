class Address < ActiveRecord::Base
  # Callbacks 
  before_save  :remove_whitespace

  # Validation
  validates :postcode, presence: true
  validates :postcode, format: { with: /\d\d\d\d\d/,
    message: "Invalid postcode format" }
  # Association
  belongs_to :business_license
  belongs_to :station

  private
  def remove_whitespace(address)
    if address.postcode != nil
      address.postcode = address.postcode.delete(' ').delete('-')
    end
  end
end
