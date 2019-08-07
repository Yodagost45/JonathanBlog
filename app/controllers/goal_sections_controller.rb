class GoalSectionsController < ApplicationController
  def index
    
  end
  def new
    @user = current_user
    @goal_section = Goal_section.new
  end
  def edit
    
  end
end