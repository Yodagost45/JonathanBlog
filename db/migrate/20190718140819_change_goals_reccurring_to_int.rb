class ChangeGoalsReccurringToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :goals, :recurring, :int
  end
end
