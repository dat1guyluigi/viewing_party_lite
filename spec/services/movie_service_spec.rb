require 'rails_helper'

RSpec.describe MovieService do
  describe 'top rated movies' do
    it 'returns top movies', :vcr do
      top_page_1 = MovieService.top_rated_movies(1)
      top_page_2 = MovieService.top_rated_movies(2)
      top_forty = top_page_1 + top_page_2

      expect(top_forty.length).to eq(40)
      expect(top_forty.second[:original_title]).to eq("The Shawshank Redemption")
      expect(top_forty.first[:title]).to eq("Dilwale Dulhania Le Jayenge")
    end
  end

#create and add cassetes/vcr
  describe 'movie search', :vcr do
    it 'searches for a movie' do
      search = MovieService.search_movies('The Shawshank Redemption')

      expect(search).to be_a(Hash)
    end
  end

  describe 'movie cast' do
    it 'returns a movie cast', :vcr do
      cast = MovieService.movie_cast(19404)

      expect(cast.first).to be_a(Hash)
      expect(cast.length).to eq(10)
      expect(cast.first[:name]).to eq("Shah Rukh Khan")
    end
  end
end
