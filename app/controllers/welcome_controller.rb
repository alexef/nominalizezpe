class WelcomeController < ApplicationController
  def index
    @people = Person.where(status: "ok").take(10)
  end

  def terms
  end

  def about
  end

  def contact
  end
end
