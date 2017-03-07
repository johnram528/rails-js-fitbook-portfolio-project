class ChangeMuscelsToMusclesInExcercises < ActiveRecord::Migration
  def change
    remove_column(:exercises, :muscels)
    add_column(:exercises, :muscles, :string)
  end
end
