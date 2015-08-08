RSpec.describe Thanos::FinderValidator do
  it 'raises an error if one or more provided params are not allowed by the API' do
    allowed_params = [:param1, :param2]
    params = { param1: double, param3: double }
    expect{
      described_class.validate(params, allowed_params)
    }.to raise_error Thanos::InvalidParamsError
  end

  it 'should not return true if all params are white-listed' do
    allowed_params = [:param1, :param2]
    params = { param1: double, param2: double }
    expect(described_class.validate(params, allowed_params)).to eq true
  end
end
