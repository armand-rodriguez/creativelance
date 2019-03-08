class Account < ApplicationRecord
  belongs_to :user
  validates :account_type, presence: true
  # TYPE = %w{ Freelancer, Recruiter }
end
