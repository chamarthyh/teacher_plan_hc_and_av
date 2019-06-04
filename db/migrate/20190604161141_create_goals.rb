class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :goal_text
      t.integer :plan_id

      t.timestamps
    end
  end
end
