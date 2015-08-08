RSpec.describe Thanos::Factory::Comic do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a comic out of api results' do
    expect(factory.build).to be_kind_of Thanos::Comic
  end
end
