class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  # GET request to users/:user_id/goals/new
  def new
    @goal_section = GoalSection.find(params[:goal_section_id])
    @goal = Goal.new
  end
  
  # GET request to /users/:user_id/goals
  def index
    
  end
  
  # POST request to /goals
  def create
    @goal_section = GoalSection.find(params[:goal_section_id])
    @goal = @goal_section.goals.new(goal_params)
    if @goal.save
      flash[:success] = "Goal created!"
      redirect_to user_goal_sections_path(user_id: params[:user_id])
    else
      render action: :new
    end
  end
  
  def edit
    @goal_section = GoalSection.find(params[:goal_section_id])
    @goal = Goal.find(params[:id])
  end
  
  # PUT request to /goal_sections/:goal_section_id/goals/:id
  def update
    @goal_section = GoalSection.find(params[:goal_section_id])
    @goal = @goal_section.goals.find(params[:id])
    if @goal.update_attributes(goal_params)
      flash[:success] = "Goal Updated!"
      redirect_to user_goal_sections_path(user_id: params[:user_id])
    else
      render action :edit
    end
  end
  
  private
    def goal_params
      params.require(:goal).permit(:title, :details, :penalty, :reward, :complete_date, :recurring, :completed, :private, :colour, :text_colour)
    end
    
    def only_current_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end
end