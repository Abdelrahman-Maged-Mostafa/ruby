class ApplicationController < ActionController::Base
   helper_method :cur_user, :logged_in? 

  def cur_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!cur_user
  end

  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end
  
  def home
  end
  def about
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
