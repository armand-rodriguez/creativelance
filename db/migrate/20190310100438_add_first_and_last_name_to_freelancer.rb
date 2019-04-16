class AddFirstAndLastNameToFreelancer < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :first_name, :string
    add_column :freelancers, :last_name, :string
  end
end
