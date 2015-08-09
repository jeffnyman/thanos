RSpec.describe Thanos::EventFinder do
  let(:finder) { described_class.new }

  before :each do
    request = 'http://gateway.marvel.com/v1/public/events?apikey=abc123&hash=53b9dadbec687f8d57cf42cdb27386ea&name=Fall%20of%20the%20Mutants&ts=1'
    stub_get(request).to_return(
      :body => fixture('event.json'),
      :headers => {:content_type => 'application/json; charset=utf-8'})

    allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'

    Thanos.authenticate do |key|
      key.public_api_key  = 'abc123'
      key.private_api_key = 'xyz123'
    end
  end

  Thanos::EventFinder::ATTRIBUTES.each do |attribute|
    parameter = Thanos::StringActions.parameterize(attribute.to_s)
    it "should respond to #{parameter}" do
      expect(finder).to respond_to("find_by_#{parameter}".to_sym)
    end
  end

  it 'builds an event out of the received response' do
    expect(finder.find_by_name('Fall of the Mutants')).to be_kind_of(Thanos::Event)
  end
end
