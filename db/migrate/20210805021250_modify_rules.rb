class ModifyRules < ActiveRecord::Migration[6.1]
  def change
    remove_column :rules, :filter
    add_column :rules, :path, :string
  end
end