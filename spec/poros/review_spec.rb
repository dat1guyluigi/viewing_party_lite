require 'rails_helper'

RSpec.describe Review do
  it 'returns review and author for a movie' do
    data = {
      author: 'SunlessKhan',
      content: 'This is the greatest movie of all time.'
    }

    review = Review.new(data)

    expect(review.author).to eq('SunlessKhan')
    expect(review.content).to eq('This is the greatest movie of all time.')
  end
end
