class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :rep_time, :muscles, :reps

  def reps
    object.routine_exercises[0].reps
  end
end
