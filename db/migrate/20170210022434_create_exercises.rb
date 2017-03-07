class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :reps
      t.string :muscels
      t.text :instructions
      t.integer :rep_time

      t.timestamps null: false
    end
  end
end
