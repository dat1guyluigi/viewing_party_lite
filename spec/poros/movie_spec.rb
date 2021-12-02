require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    data = {
      title: 'Step Brothers',
      vote_average: '6',
      runtime: '120',
      genres: 'Comedy',
      summary: 'crazy step brothers',
      cast: 'Will Ferrell',
      reviews: 'Super funny'
      }

      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.title).to eq('Step Brothers')
      expect(movie.vote_average).to eq('6')
      expect(movie.runtime).to eq('120')
      expect(movie.genres).to eq('Comedy')
      expect(movie.summary).to eq('crazy step brothers')
      expect(movie.cast).to eq('Will Ferrell')
      expect(movie.reviews).to eq('Super funny')
  end
end
