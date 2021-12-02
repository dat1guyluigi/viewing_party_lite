class MoviesController < ApplicationController

    def index
      @user = User.find(params[:user_id])

      @movies = if params[:query].present?
        MovieFacade.movie_search(params[:query])
      else
        MovieFacade.top_movies
    end
  end

  def show

  end 
end
