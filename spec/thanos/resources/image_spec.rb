RSpec.describe Thanos::Image do
  let(:image) { Thanos::Image.new({ 'path' => 'some_path', 'extension' => 'png' }) }

  it '#full_path' do
    expect(image.full_path).to eq('some_path.png')
  end
end
