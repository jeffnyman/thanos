RSpec.describe Thanos::CharacterFinder do
  let(:finder) { described_class.new }

  it 'build a character out of the received response' do
    expect(finder.find_by_name('Hulk')).to be_kind_of(Thanos::Character)
  end
end
