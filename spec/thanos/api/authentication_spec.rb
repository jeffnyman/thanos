RSpec.describe Thanos::API::Authentication do
  before :each do
    allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'

    Thanos.authenticate do |key|
      key.public_api_key  = 'abc123'
      key.private_api_key = 'xyz123'
    end
  end

  it 'returns api credentials as hash' do
    expect(Thanos::API::Authentication.get).to eq(
      { ts: '1', apikey: 'abc123', hash: '53b9dadbec687f8d57cf42cdb27386ea' })
  end
end
