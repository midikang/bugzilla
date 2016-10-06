class AddUserToBugs < ActiveRecord::Migration
  def change
  	add_column :bugs, :user_id, :string
  end
end
