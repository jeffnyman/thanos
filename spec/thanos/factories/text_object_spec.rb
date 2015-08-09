RSpec.describe Thanos::Factory::TextObject do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['textObjects']) }

  it 'builds a list of text objects from api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::TextObject)
  end
end
