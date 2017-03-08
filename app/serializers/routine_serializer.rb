class RoutineSerializer < ActiveModel::Serializer
  include ApplicationHelper

  attributes :id, :name, :estimated_time, :created_by
  has_many :exercises
  belongs_to :user

  def estimated_time
    show_estimated_time(object)
  end

end
