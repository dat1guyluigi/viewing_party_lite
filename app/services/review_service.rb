
class ReviewService
  def self.review(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end
end
