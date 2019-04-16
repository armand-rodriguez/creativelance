class AddAttrToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :freelancer_id, :integer, index: true
    add_column :requests, :request_status_id, :integer, index: true, default: 1
    add_column :requests, :request_description, :string
  end
end
