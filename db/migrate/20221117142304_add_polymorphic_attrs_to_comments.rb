class AddPolymorphicAttrsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    remove_column :comments, :user_id, :integer
  end
end
