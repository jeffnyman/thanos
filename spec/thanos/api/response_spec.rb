RSpec.describe Thanos::API::Response do
  before :each do
    request = 'http://gateway.marvel.com/v1/public/characters?apikey=abc123&hash=53b9dadbec687f8d57cf42cdb27386ea&ts=1'

    stub_get(request).to_return(
      :body => fixture('character.json'),
      :headers => {:content_type => 'application/json; charset=utf-8'})

    allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'

    Thanos.authenticate do |key|
      key.public_api_key  = 'abc123'
      key.private_api_key = 'xyz123'
    end

    @response = Thanos::API::Client.new.get(:characters, {})
  end

  it 'has a response code ' do
    expect(@response.code).to eq 200
  end

  it 'has a status' do
    expect(@response.status).to eq 'Ok'
  end
end
