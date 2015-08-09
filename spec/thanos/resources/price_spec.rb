RSpec.describe Thanos::Price do
  let(:price) { Thanos::Price.new({'type' => 'printPrice', 'price' => 3.99}) }

  it '#type - type of price' do
    expect(price.type).to eq('printPrice')
  end

  it '#price - the price' do
    expect(price.price).to eq(3.99)
  end
end
