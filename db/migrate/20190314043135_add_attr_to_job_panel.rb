class AddAttrToJobPanel < ActiveRecord::Migration[5.2]
  def change
    add_column :job_panels, :job_id, :integer, index: true
  end
end
