class ExerciseSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :name, :instructions, :rep_time, :muscles, :reps, :estimated_time

  def reps
    object.routine_exercises[0].reps
  end

  def estimated_time 
    show_estimated_time(object)
  end
end
