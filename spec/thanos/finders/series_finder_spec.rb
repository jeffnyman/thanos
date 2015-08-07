RSpec.describe Thanos::SeriesFinder do
  let(:finder) { described_class.new }

  before :each do
    request = 'http://gateway.marvel.com/v1/public/series?apikey=abc123&hash=53b9dadbec687f8d57cf42cdb27386ea&name=The%20Avengers&ts=1'
    stub_get(request).to_return(
        :body => fixture('series.json'),
        :headers => {:content_type => 'application/json; charset=utf-8'})

    allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'

    Thanos.authenticate do |key|
      key.public_api_key  = 'abc123'
      key.private_api_key = 'xyz123'
    end
  end


  it 'builds a series out of the received response' do
    expect(finder.find_by_name('The Avengers')).to be_kind_of(Thanos::Series)
  end
end
