class CreateUpbridge < ActiveRecord::Migration
  def change
    create_table :upbridges do |t|
    t.belongs_to :users,index: true
    t.belongs_to :projects,index: true
    t.datetime :update_date
    t.timestamps
    end
  end
end
