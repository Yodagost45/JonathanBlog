class FixingForeignKeysBetter < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :user_id, :int
    remove_foreign_key :goals, name: "user_id"
    remove_column :goal_sections, :user_id, :int
    remove_foreign_key :goal_sections, name: "user_id"
    
    add_foreign_key :goal_sections, :users
    add_foreign_key :goals, :goal_sections
  end
end
