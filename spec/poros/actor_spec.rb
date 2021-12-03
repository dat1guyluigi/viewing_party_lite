require 'rails_helper'

RSpec.describe Actor do
  it 'exists' do
    data = {
    :name=>"Shah Rukh Khan",
    :character=>"Raj Malhotra"}

    actor = Actor.new(data)
    expect(actor.name).to eq("Shah Rukh Khan")
    expect(actor.character).to eq("Raj Malhotra")
  end
end