
class MovieFacade

  def self.reviews(movie_id)
    ReviewService.review(movie_id)[:results].map do |review|
      Review.new(review)
    end
  end

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
end
