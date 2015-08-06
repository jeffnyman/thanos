RSpec.describe Thanos::Series do
  let(:data) { fixture('series.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:series) { Thanos::Factory::Series.new(results).build }

  it '#id - The unique ID of the series resource' do
    expect(series.id).to eq(2002)
  end

  it '#title - Series title' do
    expect(series.title).to eq('Daredevil (1963 - 1998)')
  end

  it '#description - A description of the series' do
    description = 'Join the Man Without Fear as he stands up for justice! ' +
      "Blind lawyer Matt Murdock protects the streets of Hell's Kitchen by " +
      'night against dangerous foes like Bullseye and the Kingpin! Includes ' +
      'the classic stories by icon Frank Miller that changed comics forever.'

    expect(series.description).to eq(description)
  end

  it '#resource_uri - Full canonical URL of the entity' do
    expect(series.resource_uri).to eq('http://gateway.marvel.com/v1/public/series/2002')
  end

  it '#start_year - The first year of publication for the series' do
    expect(series.start_year).to eq(1963)
  end

  it '#end_year - The last year of publication for the series (conventionally, 2099 for ongoing series)' do
    expect(series.end_year).to eq(1998)
  end

  it '#rating - The age-appropriateness rating for the series.' do
    expect(series.rating).to eq('')
  end

  it '#type - The type designation of the series' do
    expect(series.type).to eq('ongoing')
  end

  it '#urls - A set of public web site URLs for the resource' do
    expect(series.urls.class).to eq(Array)
    expect(series.urls.first.url).to eq 'http://marvel.com/comics/series/2002/daredevil_1963_-_1998?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7'
    expect(series.urls.first.type).to eq 'detail'
    expect(series.urls.first.class).to eq(Thanos::Url)
  end

  it '#thumbnail - The representative image for this series' do
    expect(series.thumbnail.path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/1/00/5130f628766d9')
    expect(series.thumbnail.extension).to eq('jpg')
    expect(series.thumbnail.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/1/00/5130f628766d9.jpg')
    expect(series.thumbnail.class).to eq(Thanos::Thumbnail)
  end
end
