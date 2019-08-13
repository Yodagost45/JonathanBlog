class AddColorOptionsForGoalSectionsAndGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :colour, :string
    add_column :goals, :text_colour, :string
    add_column :goal_sections, :text_colour, :string
  end
end
