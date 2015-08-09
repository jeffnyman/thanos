RSpec.describe Thanos::Date do
  let(:date) { Thanos::Date.new({ 'type' => 'onsaleDate', 'date' => '2011-03-30T00:00:00-0400' }) }

  it '#date' do
    expect(date.date.year).to eq(2011)
    expect(date.date.month).to eq(03)
    expect(date.date.day).to eq(30)
  end

  it '#type' do
    expect(date.type).to eq('onsaleDate')
  end
end
