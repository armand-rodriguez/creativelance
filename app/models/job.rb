class Job < ApplicationRecord
  belongs_to :recruiter
  belongs_to :user
  has_many :requests
  has_one :job_panel
  has_one :job_room
  belongs_to :job_status
  has_many :tasks
  has_many :submissions
  scope :jobs_desc, -> { order(id: :desc) }
end
