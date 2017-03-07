class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update]
 
  def show
    if current_user
      if blank_profile
        flash[:message] = "Must enter your stats before viewing profile."
        redirect_to root_path
      elsif !has_access?
        access_denied
        redirect_to user_path(current_user)
      else
        render "show"
      end
    else
      flash[:message] = "Please login."
      redirect_to new_user_session_path
    end
  end

  def edit
    if current_user
      @user = User.find_by(id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def update
    redirect_to new_user_session_path unless has_access?
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:height, :weight)
    end

    def set_user
        @user = User.find_by_id(params[:id]) 
    end

    def blank_profile
      has_access? && @user.incomplete_profile?
    end
end
