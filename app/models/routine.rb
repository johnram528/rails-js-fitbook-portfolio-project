class Routine < ActiveRecord::Base
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises
  belongs_to :user, inverse_of: :routines

  validates_presence_of :exercises
  accepts_nested_attributes_for :routine_exercises, reject_if: :all_blank

  def estimated_time
    exercises.map(&:estimated_time).inject(45, :+) unless exercises.empty? #accounts for 45 second break between exercise.
  end
  
  def muscles
    muscles = []
    exercises.pluck(:muscles).each do |muscle|
      muscle.scan(/\w+/) {|musc| muscles << musc}
    end
    muscles.uniq!
    muscles.join(", ")
  end

  def exercises_attributes=(exercises)
    exercises.values.each do |exercise|
      self.exercises.build(exercise) unless exercise.values.include?("")
      self.save
    end
  end

  def add_exercises
    exercises.each do |exercise|
      exercise.routine_exercises.each do |join| 
        join.update(routine: @routine, reps: exercise.reps)
      end
    end
  end

end
