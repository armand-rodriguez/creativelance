class AddReqStatusToRequestsStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :request_statuses, :req_status, :string
  end
end
