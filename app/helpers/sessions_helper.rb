module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    # Guard against session replay attacks.
    # See https://bit.ly/33UvK0w for more.
    session[:session_token] = user.session_token
  end


  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    reset_session  
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    @current_user = nil
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= if (user_id = session[:user_id])
                          user=User.find_by(id:user_id)
                          user if user && user.session_token==session[:session_token]
                      elsif (user_id = cookies.encrypted[:user_id])
                        user = User.find_by(id: user_id)
                        if user && user.authenticated?(cookies[:remember_token])
                          log_in user
                          user
                        end
                      end
  end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

   # Returns true if the given user is the current user.
   def current_user?(user)
    user && user == current_user
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
