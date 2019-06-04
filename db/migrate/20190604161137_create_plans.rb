class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.integer :teacher_id
      t.integer :coach_id
      t.string :status

      t.timestamps
    end
  end
end
