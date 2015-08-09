RSpec.describe Thanos::Factory::Image do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['images']) }

  it 'builds a list of images from api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Image)
  end
end
