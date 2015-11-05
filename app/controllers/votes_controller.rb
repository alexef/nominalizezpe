class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user

    vote_valid = current_user.votes.count < 5 && !current_user.votes.exists?(:person => @vote.person)

    respond_to do |format|
      if vote_valid && @vote.save
        format.html { redirect_to @vote.person, notice: 'Iti multumim pentru vot!' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { redirect_to @vote.person, notice: 'Ne pare rau, dar votul este invalid sau ai depasit numarul de 5 voturi.' }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Votul a fost anulat!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:comment)
    end
end
