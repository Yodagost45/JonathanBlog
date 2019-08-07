class CreateGoalSections < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :goals, name: "user_id"
    create_table :goal_sections do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :colour
      t.float :width
      t.float :height
      t.float :x_pos
      t.float :y_pos
      t.boolean :private
    end
    add_foreign_key :goal_sections, :users
    add_foreign_key :goals, :goal_sections
  end
end
