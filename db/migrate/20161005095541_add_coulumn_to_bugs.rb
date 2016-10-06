class AddCoulumnToBugs < ActiveRecord::Migration
  def change
  	add_column :bugs, :project_id, :string
  end
end
