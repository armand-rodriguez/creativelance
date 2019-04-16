class Panel < ApplicationRecord
  belongs_to :user
  belongs_to :account, optional: true
  has_one :freelancer
  has_one :recruiter

end
