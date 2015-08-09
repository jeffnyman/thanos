RSpec.describe Thanos::CreatorDataMapper do
  let(:json) { fixture('creator.json').read }
  let(:response) { Thanos::API::Response.new(json) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:first_name]).to eq('Simone')
    expect(mapped_attributes[:middle_name]).to eq('')
    expect(mapped_attributes[:last_name]).to eq('Bianchi')
  end

  it 'rejects invalid json attributes' do
    expect(mapped_attributes[:some_invalid_attribute]).to be_nil
  end
end
