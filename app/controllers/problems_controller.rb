class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params, user_id: @current_user)
    p @current_user
    if @problem.save
      flash[:success] = "Your problem has been posted for solving."
      redirect_to problem_path(@problem)
    else
      flash[:error] = "There was a problem with your problem. Seriously."
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def index
  end

  private

  def problem_params
    params.require(:problem).permit(:description, :attempt)
  end


end
