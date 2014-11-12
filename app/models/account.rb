class Account < ActiveRecord::Base

  # associations
  belongs_to :user

  # validations
  validates :subdomain, uniqueness: true

end
