class GoalSectionsController < ApplicationController
  def index
    
  end
  
  def new
    @user = current_user
    @goal_section = GoalSection.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @goal_section = @user.goal_sections.new(goal_section_params)
    if @goal_section.save
      flash[:success] = "Goal section created!"
      redirect_to user_goal_sections_path(user_id: params[:user_id])
    else
      render action: :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @goal_section = @user.goal_sections.find(params[:id])
    if @goal_section.update_attributes(goal_section_params)
      flash[:success] = "Goal Section Updated!"
      redirect_to user_goal_sections_path(user_id: params[:user_id])
    else
      render action :edit
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @goal_section = @user.goal_sections.find(params[:id])
    if @goal_section.destroy
      flash[:success] = "Goal Section Deleted"
      redirect_to user_goal_sections_path(user_id: params[:user_id])
    else
      render action :edit
    end
  end
  
  private
    def goal_section_params
      params.require(:goal_section).permit(:name, :colour, :width, :height, :x_pos, :y_pos, :private, :text_colour)
    end
end