class AddAttrToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :description, :text
    add_column :submissions, :link, :string
  end
end
