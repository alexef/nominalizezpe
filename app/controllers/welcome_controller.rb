class WelcomeController < ApplicationController
  def index
    @people = Person.where(status: "ok").joins(:votes).group("people.id").order("count(*) desc").take(10)
  end

  def terms
  end

  def about
  end

  def contact
  end

  def result
  end
end
