class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.integer :sttudent_id
      t.string :name
      t.string :cnic
      t.string :roll_no

      t.timestamps
    end
  end
end
