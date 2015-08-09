RSpec.describe Thanos::Factory::Creator do
  let(:data) { fixture('creator.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a creator out of api results' do
    expect(factory.build).to be_kind_of Thanos::Creator
  end
end
