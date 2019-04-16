class AddAttributesToRecruiter < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :first_name, :string
    add_column :recruiters, :last_name, :string
    add_column :recruiters, :company, :string
    add_column :recruiters, :company_description, :string
    add_column :recruiters, :resume, :string
  end
end
