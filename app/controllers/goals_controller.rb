class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  # GET request to users/:user_id/goals/new
  def new
    @goal_section = Goal_section.find(params[:goal_section_id])
    @goal = Goal.new
  end
  
  # GET request to /users/:user_id/goals
  def index
    
  end
  
  # POST request to /goals
  def create
    @goal_section = goal_section.find(params[:goal_section_id])
    @goal = @goal_section.goals.new(goal_params)
    if @goal.save
      flash[:success] = "Goal created!"
      redirect_to user_goals_path
    else
      render action: :new
    end
  end
  
  private
    def goal_params
      params.require(:goal).permit(:title, :details, :penalty, :reward, :complete_date, :recurring, :completed, :private)
    end
    
    def only_current_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end
end