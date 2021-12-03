require 'rails_helper'

RSpec.describe ReviewService do
  it 'returns reviews' do
    review = ReviewService.review(19404)

    expect(review).to be_a(Hash)
    expect(review[:id]).to eq(19404)
  end
end
