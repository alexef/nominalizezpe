class PeopleController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :destroy, :update]
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :check_moderator!, only: [:edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.where(status: "ok")
    @people.sort_by { |p| p.pozitive_votes.count}
  end

  # GET /people/1
  # GET /people/1.json
  def show
    redirect_to person_by_name_path(@person.encoded_name)
  end

  def show_by_name
    @person = Person.find_by_encoded_name!(params[:encoded_name])
    if @person.status != 'ok'
      check_moderator!
    end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.user = current_user

    respond_to do |format|
      if current_user.people.count < 5 && @person.save
        format.html { redirect_to @person, notice: 'Iti multumim pentru propunere!' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { redirect_to :back, notice: 'Poti propune doar 5 persoane! Daca nu ai depasit aceasta limita te rugam sa ne contactezi!' }
        format.json { render json: @person.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:status, :first_name, :last_name, :picture_url, :description,
                                     :fb_url, :linkedin_url, :opening_ids => [])
    end
end
