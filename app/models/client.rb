class Client < ActiveRecord::Base
  # Audited
  audited on: [:update, :destroy]
  # Acts As Commentable
  acts_as_commentable
  # Association
  has_one :business_license, as: :company
  has_many :managers
end
