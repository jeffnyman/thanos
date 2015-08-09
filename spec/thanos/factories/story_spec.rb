RSpec.describe Thanos::Factory::Story do
  let(:json) { fixture('story.json').read }
  let(:response) { Thanos::API::Response.new(json) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a story out of api results' do
    expect(factory.build).to be_kind_of(Thanos::Story)
  end
end
