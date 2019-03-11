class Freelancer < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :panel
  validates :skills, presence: true
  validates :specialization, presence: true
  validates :description, presence: true
  validates :resume, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
