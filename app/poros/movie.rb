class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :id,
              :image


  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @cast = data[:cast]
    @reviews = data[:reviews]
    @id = data[:id]
    @image = "https://image.tmdb.org/t/p/original#{data[:poster_path]}"
  end
end
