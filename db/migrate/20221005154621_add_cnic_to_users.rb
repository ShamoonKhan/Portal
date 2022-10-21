class AddCnicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cnic, :string
  end
end
