class ModeratorController < ApplicationController
  before_action :set_person, only: [:make_ok, :make_reject, :make_new]
  before_action :check_moderator!

  def index
    @people = Person.all.order(created_at: :desc)
  end

  def users
    @users = User.all.order(created_at: :desc)
  end

  def make_ok
    @person.status = 'ok'
    @person.save
    redirect_to '/moderator/index'
  end

  def make_reject
    @person.status = 'rej'
    @person.save
    redirect_to '/moderator/index'
  end

  def make_new
    @person.status = 'new'
    @person.save
    redirect_to '/moderator/index'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

end
