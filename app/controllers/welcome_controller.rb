class WelcomeController < ApplicationController
  def index
    @people = Person.all
  end

  def terms
  end

  def about
  end

  def contact
  end
end
