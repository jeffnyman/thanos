RSpec.describe Thanos::Client do
  before :each do
    Thanos.authenticate do |key|
      key.public_api_key = 'abc123'
      key.private_api_key = 'xyz123'
    end

    @client = Thanos::Client.new
  end
end
