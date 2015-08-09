RSpec.describe Thanos::Factory::Item::Series do
  let(:data) { fixture('character.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['series']['items']) }

  it 'builds a serie summary out of api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Item::Series)
  end
end
