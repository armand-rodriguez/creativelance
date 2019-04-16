class Request < ApplicationRecord
  belongs_to :freelancer
  belongs_to :request_status
  belongs_to :job
end
