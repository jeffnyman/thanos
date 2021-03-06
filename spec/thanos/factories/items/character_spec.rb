RSpec.describe Thanos::Factory::Item::Character do
  let(:data) { fixture('event.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['series']['items']) }

  it 'builds a character item out of api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Item::Character)
  end
end
