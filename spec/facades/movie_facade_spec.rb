require 'rails_helper'

RSpec.describe MovieFacade do
  it 'gets the top 40 movies' do
    results = MovieFacade.top_movies

    expect(results).to be_a(Array)
    expect(results.first).to be_a(Movie)
    expect(results.count).to eq(40)
  end

  it 'returns a movie thats been searched for' do
    search = MovieFacade.movie_search('The Shawshank Redemption')

    expect(search).to be_a(Array)
    expect(search.first).to be_a(Movie)
    expect(search.first.title).to eq('The Shawshank Redemption')
  end
end
