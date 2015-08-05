RSpec.describe Thanos::Authentication do
  before :each do
    Thanos.authenticate do |key|
      key.public_api_key = 'abc123'
      key.private_api_key = 'xyz123'
    end
  end

  it 'has a public key' do
    expect(Thanos.authentication.public_api_key).to eq('abc123')
  end

  it 'has a private key' do
    expect(Thanos.authentication.private_api_key).to eq('xyz123')
  end
end
