RSpec.describe Thanos::TextObject do
  let(:to) { Thanos::TextObject.new({ 'type' => 'solicit text',
                                      'language' => 'LAT',
                                      'text' => 'Lorem ipsum dolor sit amet.' })
  }

  it '#type - The string description of the text object (e.g. solicit text, preview text, etc.)' do
    expect(to.type).to eq('solicit text')
  end

  it '#language - A language code denoting which language the text object is written in' do
    expect(to.language).to eq('LAT')
  end

  it '#text - The text of the text object' do
    expect(to.text).to eq('Lorem ipsum dolor sit amet.')
  end
end
