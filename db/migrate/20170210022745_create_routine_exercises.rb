class CreateRoutineExercises < ActiveRecord::Migration
  def change
    create_table :routine_exercises do |t|
      t.integer :routine_id
      t.integer :exercise_id
      t.integer :reps

      t.timestamps null: false
    end
    add_index :routine_exercises, :routine_id
    add_index :routine_exercises, :exercise_id
  end
end
