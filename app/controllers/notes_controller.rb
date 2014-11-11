class NotesController < ApplicationController

  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.build(note_params)
    @note.user = current_user

    respond_to do |format|
      format.html do
        if @note.save
          # UserMailer.note_update_email(current_user, @problem).deliver
          flash.now[:notice] = 'Answered!'
        else
          flash.now[:notice] = 'Your answer is invalid.'
        end
        redirect_to @problem
      end

      format.js do
        if @note.save
          render :create, status: :created
        else
          render nothing: true, status: :bad_request
        end
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end

end