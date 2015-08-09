RSpec.describe Thanos::Factory::Item::Creator do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['creators']['items']) }

  it 'builds a creator summary out of api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Item::Creator)
  end
end
