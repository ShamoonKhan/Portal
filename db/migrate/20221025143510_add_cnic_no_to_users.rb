class AddCnicNoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cnic_no, :string
  end
end
