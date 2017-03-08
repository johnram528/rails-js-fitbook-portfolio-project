class RoutineSerializer < ActiveModel::Serializer
  attributes :id, :name, :estimated_time, :user_id
  has_many :exercises
end
