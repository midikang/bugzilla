class ChangeTypeCoulmnNameType < ActiveRecord::Migration
  def change
  	rename_column :bugs, :typee, :ty
  end
end
