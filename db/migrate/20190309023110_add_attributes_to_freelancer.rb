class AddAttributesToFreelancer < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :skills, :string
    add_column :freelancers, :specialization, :string
    add_column :freelancers, :description, :text
    add_column :freelancers, :resume, :text
  end
end
