class Task < ApplicationRecord
  belongs_to :task_status
  belongs_to :job
  belongs_to :user
  has_many :submissions
  has_many_attached :images
  has_many_attached :documents
  validate :image_type
  validate :document_type
  scope :tasks_asc, -> { order(id: :asc) }

  private

  def image_type
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'needs to be a jpeg or png')
      end
    end
  end

  def document_type
    documents.each do |image|
      if !image.content_type.in?(%('application/pdf'))
        errors.add(:documents, 'needs to be a pdf')
      end
    end
  end
end
