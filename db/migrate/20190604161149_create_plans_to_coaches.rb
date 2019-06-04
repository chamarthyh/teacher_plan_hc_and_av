class CreatePlansToCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :plans_to_coaches do |t|
      t.integer :plan_id
      t.integer :coach_id

      t.timestamps
    end
  end
end
