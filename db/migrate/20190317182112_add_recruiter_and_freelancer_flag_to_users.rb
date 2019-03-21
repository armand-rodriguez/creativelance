class AddRecruiterAndFreelancerFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_recruiter, :boolean, default: false, null: false
    add_column :users, :is_freelancer, :boolean, default: false, null: false
  end
end
