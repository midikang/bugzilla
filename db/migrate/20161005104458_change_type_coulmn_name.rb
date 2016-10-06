class ChangeTypeCoulmnName < ActiveRecord::Migration
  def change
  	rename_column :bugs, :type, :typee
  end
end
