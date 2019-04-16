class RegistrationStatus < ApplicationRecord
  has_many :accounts
  has_many :users
end
