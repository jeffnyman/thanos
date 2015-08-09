RSpec.describe Thanos::StoryFinder do
  let(:finder) { described_class.new }

  before :each do
    request = 'http://gateway.marvel.com/v1/public/stories?apikey=abc123&comics=1,%202,%203&hash=53b9dadbec687f8d57cf42cdb27386ea&ts=1'

    stub_get(request).to_return(
        :body => fixture('story.json'),
        :headers => {:content_type => 'application/json; charset=utf-8'})

    allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'

    Thanos.authenticate do |key|
      key.public_api_key  = 'abc123'
      key.private_api_key = 'xyz123'
    end
  end

  Thanos::StoryFinder::ATTRIBUTES.each do |attribute|
    parameter = Thanos::StringActions.parameterize(attribute.to_s)
    it "should respond to #{parameter}" do
      expect(finder).to respond_to("find_by_#{parameter}".to_sym)
    end
  end

  it 'builds a story out of the received response' do
    expect(finder.find_by_comics('1, 2, 3')).to be_kind_of(Thanos::Story)
  end
end
