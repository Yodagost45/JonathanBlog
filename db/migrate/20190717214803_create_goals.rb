class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :details
      t.text :penalty
      t.text :reward
      t.date :complete_date
      t.boolean :recurring
      t.boolean :completed
      t.boolean :private
      t.timestamps
    end
    add_foreign_key :goals, :users
    
  end
end
