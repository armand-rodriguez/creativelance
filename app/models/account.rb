class Account < ApplicationRecord
  belongs_to :user
  has_one :freelancer
  has_one :recruiter
  validates :account_type, presence: true
  # ACCOUNT_TYPE = %w{ Freelancer, Recruiter }
  belongs_to :registration_status
end
