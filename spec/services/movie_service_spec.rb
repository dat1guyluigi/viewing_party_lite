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
end