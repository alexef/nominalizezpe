class ModeratorController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @people = Person.all
  end
end
