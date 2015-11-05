class WelcomeController < ApplicationController
  def index
    @people = Person.where(status: "ok")
    @people.sort_by { |p| p.votes.count}
    @people = @people.slice(0, 10)
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
