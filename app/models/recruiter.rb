class Recruiter < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :panel
  has_many :jobs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :company_description, presence: true
  validates :resume, presence: true
end
