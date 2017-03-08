class RoutineExerciseSerializer < ActiveModel::Serializer
  attributes :id, :reps
  belongs_to :routine 
  belongs_to :exercise
end
