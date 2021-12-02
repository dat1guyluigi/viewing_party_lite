class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews


  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:summary]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end 
end
