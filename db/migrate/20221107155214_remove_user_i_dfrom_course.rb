class RemoveUserIDfromCourse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :user_id, null: true, foreign_key: true
  end
end
