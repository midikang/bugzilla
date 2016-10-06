class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
    t.string :title
   	t.string :type
   	t.string :status
   	t.timestamps
    end
  end
end
