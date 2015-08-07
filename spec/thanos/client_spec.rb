RSpec.describe Thanos::Client do
  before :each do
    Thanos.authenticate do |key|
      key.public_api_key = 'abc123'
      key.private_api_key = 'xyz123'
    end

    @client = Thanos::Client.new
  end

  it 'has a character finder' do
    expect(@client.characters.class).to eq(Thanos::CharacterFinder)
  end

  it 'has a series finder' do
    expect(@client.series.class).to eq(Thanos::SeriesFinder)
  end

  it 'has a event finder' do
    expect(@client.events.class).to eq(Thanos::EventFinder)
  end

  it 'has a comic finder' do
    expect(@client.comics.class).to eq(Thanos::ComicFinder)
  end
end
