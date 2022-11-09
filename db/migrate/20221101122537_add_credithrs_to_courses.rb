class AddCredithrsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :credithrs, :integer
  end
end
