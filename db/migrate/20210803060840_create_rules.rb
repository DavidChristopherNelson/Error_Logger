class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.integer :execution_order
      t.string :filter

      t.timestamps
    end
  end
end
