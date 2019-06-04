class CreateActionSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :action_steps do |t|
      t.string :action_step
      t.date :target_date
      t.string :lead_person
      t.string :resources_needed
      t.string :specifics
      t.integer :goal_id
      t.string :measures_of_success

      t.timestamps
    end
  end
end
