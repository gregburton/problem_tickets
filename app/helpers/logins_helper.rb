module LoginsHelper
  def login(user)
    login[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: login[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    login.delete(:user_id)
    @current_user = nil
  end
end
