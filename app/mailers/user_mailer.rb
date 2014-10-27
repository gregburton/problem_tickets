class UserMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def create_problem_email(user, problem)
    @user = user
    @problem = problem
    mail to: user.email, subject: "You have a problem...posted."
  end

  def note_update_email(author, problem)
    @user = problem.user
    @author = author.name
    @problem = problem
    mail to: @user.email, subject: "#{@author} might have a solution!"
  end
end
