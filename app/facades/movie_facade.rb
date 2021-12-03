
class MovieFacade
  def self.top_movies
    page_1 = MovieService.top_rated_movies(1)
    page_2 = MovieService.top_rated_movies(2)

    forty_movies = page_1 + page_2

    forty_movies.map do |data|
      Movie.new(data)
    end
  end

  def self.movie_search(query)
    search = MovieService.search_movies(query)

    search[:results].map do |data|
      Movie.new(data)
    end
  end

  def self.movie_cast(movie_id)
    cast = MovieService.movie_cast(movie_id)
    cast.map do |actor|
      Actor.new(actor)
    end
  end
end
