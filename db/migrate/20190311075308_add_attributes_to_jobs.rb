class AddAttributesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :job_title, :string
    add_column :jobs, :job_description, :string
    add_column :jobs, :job_skills, :string
    add_column :jobs, :recruiter_id, :integer, index: true
    add_column :jobs, :rate, :integer
  end
end
