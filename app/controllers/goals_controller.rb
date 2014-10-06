class GoalsController < ApplicationController

  before_action :require_logged_in

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to user_goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to user_goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :status, :privacy, :user_id)
  end
end
