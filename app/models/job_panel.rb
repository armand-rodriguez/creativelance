class JobPanel < ApplicationRecord
  belongs_to :job, dependent: :destroy
  belongs_to :user
end
