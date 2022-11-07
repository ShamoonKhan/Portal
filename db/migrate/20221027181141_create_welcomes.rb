class CreateWelcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :welcomes do |t|
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
