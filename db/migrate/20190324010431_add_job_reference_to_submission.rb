class AddJobReferenceToSubmission < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :job_id, :integer, index: true
  end
end
