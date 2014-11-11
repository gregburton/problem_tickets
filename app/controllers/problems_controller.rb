class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      # UserMailer.create_problem_email(current_user, @problem).deliver
      flash[:success] = 'Your problem has been posted for solving.'
      redirect_to problem_path(@problem)
    else
      flash[:error] = 'There was a problem with your problem. Seriously.'
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
    @notes = @problem.notes
    @note = Note.new
  end

  def index
    @problem_where = Problem.where(solved: false)
    @problems = @problem_where.paginate(page: params[:page], per_page: 5)
  end

  def solved
    @problem = Problem.find(params[:id])
    @problem.update_attributes(solved: true)
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.js do
        render :solved, status: 200
      end
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:description, :attempt)
  end

end
