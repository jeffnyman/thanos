RSpec.describe Thanos::StringActions do
  it 'can parameterize strings' do
    expect(described_class.parameterize('camelCasedString')).to eq 'camel_cased_string'
  end
end
