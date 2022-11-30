class AddAssignmentToSubmits < ActiveRecord::Migration[7.0]
  def change
    add_reference :submits, :assignment, null: false, foreign_key: true
  end
end
