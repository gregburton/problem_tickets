class NotesController < ApplicationController

  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.build(note_params)
    @note.user = current_user

    if @note.save
      flash.now[:notice] = "Answered!"
    else
      flash.now[:notice] = "Your answer is invalid."
    end
    redirect_to @problem
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end

end
