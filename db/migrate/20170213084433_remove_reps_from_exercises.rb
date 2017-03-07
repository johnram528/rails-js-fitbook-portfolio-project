class RemoveRepsFromExercises < ActiveRecord::Migration
  def change
    remove_column(:exercises, :reps, :integer)
  end
end
