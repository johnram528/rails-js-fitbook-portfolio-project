class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :rep_time, :muscles, :routine_exercises
end
