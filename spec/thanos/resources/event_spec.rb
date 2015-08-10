RSpec.describe Thanos::Event do
  let(:data) { fixture('event.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:event) { Thanos::Factory::Event.new(results).build }

  it '#id - The unique ID of the event resource' do
    expect(event.id).to eq(248)
  end

  it '#title - The title of the event' do
    expect(event.title).to eq('Fall of the Mutants')
  end

  it '#description - A description of the event.' do
    description = 'The X-Men battled the Adversary in Dallas, and X-Factor ' +
      'clashed with the Horsemen of Apocalypse in New York, while the New ' +
      'Mutants confronted the insane Ani-Mator on Paradise Island.'

    expect(event.description).to eq(description)
  end

  it '#resourceURI - The canonical URL identifier for this resource' do
    expect(event.resource_uri).to eq('http://gateway.marvel.com/v1/public/events/248')
  end

  it '#start - The date of publication of the first issue in this event' do
    expect(event.start.class).to eq(DateTime)
    expect(event.start.year).to eq(1988)
    expect(event.start.month).to eq(01)
    expect(event.start.day).to eq(10)
  end

  it '#end - The date of publication of the last issue in this event' do
    expect(event.end.class).to eq(DateTime)
    expect(event.end.year).to eq(2007)
    expect(event.end.month).to eq(01)
    expect(event.end.day).to eq(17)
  end

  it '#urls - A set of public web site URLs for the event' do
    expect(event.urls.class).to eq(Array)
    expect(event.urls.first.class).to eq(Thanos::Url)
    expect(event.urls.first.type).to eq('detail')
    expect(event.urls.first.url).to eq('http://marvel.com/comics/events/248/fall_of_the_mutants?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7')
  end

  it '#thumbnail - The representative image for this event' do
    expect(event.thumbnail.class).to eq(Thanos::Thumbnail)
    expect(event.thumbnail.path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/8/a0/51cb2f521ae35')
    expect(event.thumbnail.extension).to eq('jpg')
    expect(event.thumbnail.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/8/a0/51cb2f521ae35.jpg')
  end

  it '#comics - A resource list containing the comics in this event' do
    expect(event.comics.class).to eq(Array)
    expect(event.comics.first.class).to eq(Thanos::Item::Comic)
    expect(event.comics.first.name).to eq('Captain America (1968) #339')
    expect(event.comics.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/comics/7720')
  end

  it '#stories - A resource list containing the stories in this event' do
    expect(event.stories.class).to eq(Array)
    expect(event.stories.first.class).to eq(Thanos::Item::Story)
    expect(event.stories.first.name).to eq('Fall of the Mutants')
    expect(event.stories.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/stories/22222')
    expect(event.stories.first.type).to eq('cover')
  end

  it '#series - A resource list containing the series in this event' do
    expect(event.series.class).to eq(Array)
    expect(event.series.first.class).to eq(Thanos::Item::Series)
    expect(event.series.first.name).to eq('Daredevil (1963 - 1998)')
    expect(event.series.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/series/2002')
  end

  it '#characters - A resource list containing the characters which appear in this event' do
    expect(event.characters.class).to eq(Array)
    expect(event.characters.first.class).to eq(Thanos::Item::Character)
    expect(event.characters.first.name).to eq('Havok')
    expect(event.characters.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/characters/1009337')
  end

  it '#creators - A resource list containing creators whose work appears in this event' do
    expect(event.creators.class).to eq(Array)
    expect(event.creators.first.class).to eq(Thanos::Item::Creator)
    expect(event.creators.first.name).to eq('Mark Gruenwald')
    expect(event.creators.first.role).to eq('writer')
    expect(event.creators.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/creators/259')
  end

  it '#next - A summary representation of the event which follows this event' do
    expect(event.next.class).to eq(Thanos::Item::Event)
    expect(event.next.resource_uri).to eq('http://gateway.marvel.com/v1/public/events/252')
    expect(event.next.type).to eq(nil)
  end

  it '#previous - A summary representation of the event which preceded this event' do
    expect(event.previous.class).to eq(Thanos::Item::Event)
    expect(event.previous.resource_uri).to eq('http://gateway.marvel.com/v1/public/events/246')
    expect(event.previous.type).to eq(nil)
  end
end
