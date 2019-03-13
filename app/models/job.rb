class Job < ApplicationRecord
  belongs_to :recruiter
  has_many :requests
end
