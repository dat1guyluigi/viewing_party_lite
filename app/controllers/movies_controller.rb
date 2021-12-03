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
    @movie = Movie.new(MovieService.movie(params[:id]))
    @reviews = MovieFacade.reviews(params[:id])
    @cast = MovieFacade.movie_cast(params[:id])
    @user = User.find(params[:user_id])
  end
end
