class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_moderator!
    unless current_user.moderator
      raise Exception('Only moderators allowed!')
    end
  end
end
