RSpec.describe Thanos::Factory::Event do
  let(:data) { fixture('event.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds an event out of api results' do
    expect(factory.build).to be_kind_of(Thanos::Event)
  end
end
