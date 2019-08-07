class AddForeignKeysToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :goal_sections, :user_id, :integer
    add_column :goals, :goal_section_id, :integer
  end
end
