class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :amount
      t.string :type
      t.string :acc_num

      t.timestamps
    end
  end
end
