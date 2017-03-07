class Exercise < ActiveRecord::Base
  attr_accessor :reps
  has_many :routine_exercises
  has_many :routines, through: :routine_exercises

  validates_presence_of :name, :rep_time, :muscles, :reps

  def estimated_time
    reps = routine_exercises.try(:last).reps
    time = reps * rep_time 
  end


end


