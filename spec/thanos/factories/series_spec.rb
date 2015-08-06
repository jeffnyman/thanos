RSpec.describe Thanos::Factory::Series do
  let(:data) { fixture('series.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a series out of api results' do
    expect(factory.build).to be_kind_of Thanos::Series
  end
end
