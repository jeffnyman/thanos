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
end
