RSpec.describe Thanos::Factory::Item::Comic do
  let(:data) { fixture('character.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['comics']['items']) }

  it 'builds a comic summary out of api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Item::Comic)
  end
end
