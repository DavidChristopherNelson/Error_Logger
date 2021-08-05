class ModifyRulesV2 < ActiveRecord::Migration[6.1]
  def change    
    add_column :rules, :field, :string
    add_column :rules, :regex, :string
  end
end
