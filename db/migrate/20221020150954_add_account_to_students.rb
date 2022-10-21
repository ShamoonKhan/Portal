class AddAccountToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :account, null: false, foreign_key: true
  end
end
