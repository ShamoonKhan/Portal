class CreateTableUserCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :table_user_courses do |t|
t.string :user_id
t.string :course_id
      t.timestamps
    end
  end
end
