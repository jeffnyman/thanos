RSpec.describe Thanos::Factory::Date do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:factory) { described_class.new(results['dates']) }

  it 'builds a list of dates from api results' do
    expect(factory.build).to be_kind_of(Array)
    expect(factory.build.first).to be_kind_of(Thanos::Date)
  end
end
