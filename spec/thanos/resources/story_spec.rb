RSpec.describe Thanos::Story do
  let(:data) { fixture('story.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:story) { Thanos::Factory::Story.new(results).build }

  it '#title - The story title' do
    expect(story.title).to eq('Cover #892')
  end

  it '#type - The story type e.g. interior story, cover, text story' do
    expect(story.type).to eq('cover')
  end

  it '#resource_uri - The canonical URL identifier for this resource' do
    expect(story.resource_uri).to eq('http://gateway.marvel.com/v1/public/stories/892')
  end

  it '#description - A short description of the story' do
    expect(story.description).to eq('')
  end

  it '#thumbnail - The representative image for this story' do
    expect(story.description).to eq('')
  end

  it '#comics - A resource list containing comics in which this story takes place' do
    expect(story.comics.class).to eq(Array)
    expect(story.comics.first.class).to eq(Thanos::Item::Comic)
    expect(story.comics.first.name).to eq('Thor (1998) #81')
  end

  it '#series - A resource list containing series in which this story appears' do
    expect(story.series.class).to eq(Array)
    expect(story.series.first.class).to eq(Thanos::Item::Series)
    expect(story.series.first.name).to eq('Thor (1998 - 2004)')
  end

  it '#events - A resource list of the events in which this story appears' do
    expect(story.events.class).to eq(Array)
    expect(story.events.first.class).to eq(Thanos::Item::Event)
    expect(story.events.first.name).to eq('Avengers Disassembled')
  end

  it '#characters - A resource list of characters which appear in this story' do
    expect(story.characters.class).to eq(Array)
    expect(story.characters.first.class).to eq(Thanos::Item::Character)
    expect(story.characters.first.name).to eq('Avengers')
  end

  it '#creators - A resource list of creators who worked on this story' do
    expect(story.creators.class).to eq(Array)
    expect(story.creators.first.class).to eq(Thanos::Item::Creator)
    expect(story.creators.first.name).to eq('Steve Epting')
  end
end
