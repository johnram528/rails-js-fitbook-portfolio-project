class RoutinesController < ApplicationController
  before_action :set_user, :set_routine
  skip_before_action :set_routine, only: [:new, :create, :index]
  skip_before_action :set_user, only: [:index]

  def index
    if current_user
      user_routines
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @routine = Routine.new
    5.times { @routine.exercises.build}
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.exercises.each do |exercise|
      exercise.routine_exercises.each do |join| 
        join.update(routine: @routine, reps: exercise.reps)
      end
    end
    if @routine.save
      @user.routines << @routine
      respond_to do |format|
        format.html { redirect_to routine_path(@routine)}
        format.json { render json: @routine, status: 201}
      end
    else
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @routine}
    end
  end

  def edit
  end

  def update
    if has_access?
      updatable
    else
      access_denied
      redirect_to @routine
    end
  end

  def destroy
    if @routine.user = @user
      @routine.destroy
      redirect_to user_routines_path(@user, @routine)
    else
      access_denied
      redirect_to @routine 
    end
  end

  private
    def routine_params
      params.require(:routine).permit(:name, :user_id, :exercises_attributes => [:name, :reps, :instructions, :rep_time, :muscles] )
    end

    def set_user
      if current_user
       @user ||= User.find_by(id: current_user.id)
      else
      redirect_to new_user_session_path 
      end
    end

    def set_routine
      @routine = Routine.find_by(id: params[:id])
    end

    def user_routines
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @routines = @user.routines
      else
        @routines = Routine.all
      end
    end

    def updatable 
      @routine.update(routine_params)
        if !@routine.errors?
        redirect_ routine_path(@routine)
      else
        render 'edit'
      end
    end

    

end
