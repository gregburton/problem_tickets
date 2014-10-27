class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def create_problem_email(user, problem)
    @user = user
    @problem = problem
    mail to: user.email, subject: "You have a problem...posted."
  end

  def note_update_email
    @user = user
    mail to: user.email, subject: "We might have a solution!"
  end
end
