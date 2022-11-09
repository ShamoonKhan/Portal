class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.datetime :date
      t.boolean :present

      t.timestamps
    end
  end
end
