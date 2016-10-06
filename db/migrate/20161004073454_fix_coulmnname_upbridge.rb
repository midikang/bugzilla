class FixCoulmnnameUpbridge < ActiveRecord::Migration
  def change
  	rename_column :upbridges, :projects_id, :project_id
  	rename_column :upbridges, :users_id, :user_id
  end
end
