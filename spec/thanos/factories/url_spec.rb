RSpec.describe Thanos::Factory::Url do
  let(:data) { fixture('series.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['urls']) }

  it 'builds a list of urls from api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Url)
  end
end
