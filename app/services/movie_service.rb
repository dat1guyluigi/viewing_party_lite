class MovieService
  def self.top_rated_movies(page)
    response = conn.get("/3/movie/top_rated?page=#{page}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  def self.search_movies(query)
    response = conn.get('/3/search/movie') do |f|
      f.params['query'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end
end
