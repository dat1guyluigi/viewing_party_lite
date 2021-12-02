class MoviesController < ApplicationController

    def index
      @movies = if params[:query].present?
        MovieFacade.movie_search(params[:query])
      else
        MovieFacade.top_movies
    end
  end 
end
