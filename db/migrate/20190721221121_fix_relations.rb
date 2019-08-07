class FixRelations < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :goals, name: "index_goals_on_user_id"
    add_foreign_key :goals, :goal_sections
  end
end
