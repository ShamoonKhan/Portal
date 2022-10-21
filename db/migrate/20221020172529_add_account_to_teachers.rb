class AddAccountToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_reference :teachers, :account, null: false, foreign_key: true
  end
end
