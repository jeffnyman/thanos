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

  it '#comics - A resource list containing comics in this series' do
    expect(series.comics.class).to eq(Array)
    expect(series.comics.first.class).to eq(Thanos::Item::Comic)
    expect(series.comics.first.name).to eq('Daredevil (1963)')
    expect(series.comics.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/comics/8072')
  end

  it '#stories - A resource list containing stories which occur in comics in this series.' do
    expect(series.stories.class).to eq(Array)
    expect(series.stories.first.class).to eq(Thanos::Item::Story)
    expect(series.stories.first.name).to eq('Life Be Not Proud!')
    expect(series.stories.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/stories/15722')
    expect(series.stories.first.type).to eq('interiorStory')
  end

  it '#events - A resource list containing events which take place in comics in this series' do
    expect(series.events.class).to eq(Array)
    expect(series.events.first.class).to eq(Thanos::Item::Event)
    expect(series.events.first.name).to eq('Acts of Vengeance!')
    expect(series.events.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/events/116')
  end

  it '#characters - A resource list containing characters which appear in comics in this series' do
    expect(series.characters.class).to eq(Array)
    expect(series.characters.first.class).to eq(Thanos::Item::Character)
    expect(series.characters.first.name).to eq('Beast')
    expect(series.characters.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/characters/1009175')
  end

  it '#creators - A resource list of creators whose work appears in comics in this series' do
    expect(series.creators.class).to eq(Array)
    expect(series.creators.first.class).to eq(Thanos::Item::Creator)
    expect(series.creators.first.name).to eq('Mark Bagley')
    expect(series.creators.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/creators/87')
    expect(series.creators.first.role).to eq('penciller (cover)')
  end
end
