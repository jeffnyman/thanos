RSpec.describe Thanos::API::Client do
  let(:client) { described_class.new }

  it '#endpoint' do
    expect(client.endpoint).to eq 'http://gateway.marvel.com/v1/public'
  end
end
