class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.build(problem_params)
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
    @note = Note.new
  end

  def index
    @problems = Problem.where(solved: false).paginate(page: params[:page], per_page: 5)
  end

  def solved
    @problem = Problem.find(params[:id])
    @problem.update_attributes(solved: true)
    redirect_to root_path
  end

  private

  def problem_params
    params.require(:problem).permit(:description, :attempt)
  end


end
