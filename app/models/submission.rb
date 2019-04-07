class Submission < ApplicationRecord
  has_many_attached :images
  has_many_attached :documents
  belongs_to :task
  belongs_to :job
end
