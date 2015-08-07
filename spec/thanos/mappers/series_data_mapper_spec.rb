RSpec.describe Thanos::SeriesDataMapper do
  let(:data) { fixture('series.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:title]).to eq('Daredevil (1963 - 1998)')
    expect(mapped_attributes[:start_year]).to eq(1963)
    expect(mapped_attributes[:end_year]).to eq(1998)
    expect(mapped_attributes[:rating]).to eq('')
    expect(mapped_attributes[:type]).to eq('ongoing')
  end
end
