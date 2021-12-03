class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = MovieService.movie(params[:movie_id])
  end

  def create
    @party = Party.create(party_params)
    require 'pry'; binding.pry
  end

  private
  def party_params
    params.require(:viewing_party).permit(:date, :time, :movie_id, :movie_title, :length, :host_id, :user_id)
  end 
end