RSpec.describe Thanos::Comic do
  let(:data) { fixture('comic.json').read }
  let(:response) { Thanos::API::Response.new(data) }
  let(:results) { Thanos::ResponseHolder.new(response).results }
  let(:comic) { Thanos::Factory::Comic.new(results).build }

  it '#id - The unique ID of the comic resource' do
    expect(comic.id).to eq(38524)
  end

  it '#title - The title of the comic' do
    expect(comic.title).to eq('Age of X: Universe (2011) #1')
  end

  it '#format - The publication format of the comic e.g. comic, hardcover, trade paperback' do
    expect(comic.format).to eq('Comic')
  end

  it '#description - The preferred description of the comic' do
    description = 'In an age without the X-Men, mutants are hated and hunted. ' +
      'The surviving mutants create a last bastion for their dying race: ' +
      'Fortress X. With this AGE OF X, humanity vows to see mutants destroyed ' +
      "and a team of champions find themselves united. \n"

    expect(comic.description).to eq(description)
  end

  it '#resource_uri - The canonical URL identifier for this resource' do
    expect(comic.resource_uri).to eq('http://gateway.marvel.com/v1/public/comics/38524')
  end

  it '#issue_number - The number of the issue in the series (will generally be 0 for collection formats)' do
    expect(comic.issue_number).to eq(1)
  end

  it '#isbn - The ISBN for the comic (generally only populated for collection formats)' do
    expect(comic.isbn).to eq('')
  end

  it '#upc - The UPC barcode number for the comic (generally only populated for periodical formats)' do
    expect(comic.upc).to eq('5960607573-00111')
  end

  it '#ean - The EAN barcode for the comic' do
    expect(comic.ean).to eq('')
  end

  it '#issn - The ISSN barcode for the comic' do
    expect(comic.issn).to eq('')
  end

  it '#page_count - The number of story pages in the comic' do
    expect(comic.page_count).to eq(40)
  end

  it '#digital_id - The ID of the digital comic representation of this comic. Will be 0 if the comic is not available digitally' do
    expect(comic.digital_id).to eq(20260)
  end

  it '#diamond_code - The Diamond code for the comic' do
    expect(comic.diamond_code).to eq('JAN110795')
  end

  it '#variant_description - If the issue is a variant (e.g. an alternate cover, second printing, or director\'s cut), a text description of the variant' do
    expect(comic.variant_description).to eq('')
  end

  describe '#dates - A list of key dates for this comic' do
    it 'is an array of date objects' do
      expect(comic.dates.class).to eq(Array)
      expect(comic.dates.first.class).to eq(Thanos::Date)
    end
  end

  it '#urls - A set of public web site URLs for the resource' do
    expect(comic.urls.class).to eq(Array)
    expect(comic.urls.first.class).to eq(Thanos::Url)
    expect(comic.urls.first.type).to eq('detail')
    expect(comic.urls.first.url).to eq('http://marvel.com/comics/issue/38524/age_of_x_universe_2011_1?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7')
  end

  it '#thumbnails - The representative image for this comic' do
    expect(comic.thumbnail.class).to eq Thanos::Thumbnail
    expect(comic.thumbnail.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/7/70/4f57719ff38c5.jpg')
  end

  it '#text_objects - A set of descriptive text blurbs for the comic' do
    blurb = 'In that age, the remaining mutants created a stronghold, a ' +
      'last bastion for their dying race: Fortress X. And in that Age Of X, ' +
      'when humanity vowed to see Fortress X destroyed, a team of heroes ' +
      'and heroines found themselves united against this terrible mutant ' +
      'threat.  This is their epoch!'

    expect(comic.text_objects.class).to eq(Array)
    expect(comic.text_objects.first.class).to eq(Thanos::TextObject)
    expect(comic.text_objects.first.type).to eq('issue_solicit_text')
    expect(comic.text_objects.first.language).to eq('en-us')
    expect(comic.text_objects.first.text).to include(blurb)
  end

  it '#images - A list of promotional images associated with this comic' do
    expect(comic.images.class).to eq(Array)
    expect(comic.images.first.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/7/70/4f57719ff38c5.jpg')
    expect(comic.images.last.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/b/b0/4d6d3430cd3bb.jpg')
  end

  it '#prices - A list of prices for this comic' do
    expect(comic.prices.class).to eq(Array)
    expect(comic.prices.first.class).to eq(Thanos::Price)
    expect(comic.prices.first.type).to eq('printPrice')
    expect(comic.prices.first.price).to eq(3.99)
  end

  it '#series - A summary representation of the series to which this comic belongs' do
    expect(comic.series.class).to eq(Array)
    expect(comic.series.first.class).to eq(Thanos::Item::Series)
    expect(comic.series.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/series/13896')
    expect(comic.series.first.name).to eq('Age of X: Universe (2011)')
  end

  it '#characters - A resource list containing the characters which appear in this comic' do
    expect(comic.characters.class).to eq(Array)
    expect(comic.characters.first.class).to eq(Thanos::Item::Character)
    expect(comic.characters.first.name).to eq('Captain America')
    expect(comic.characters.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/characters/1009220')
  end

  it '#creators - A resource list containing the creators associated with this comic' do
    expect(comic.creators.class).to eq(Array)
    expect(comic.creators.first.class).to eq(Thanos::Item::Creator)
    expect(comic.creators.first.name).to eq('Simone Bianchi')
    expect(comic.creators.first.role).to eq('penciller (cover)')
    expect(comic.creators.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/creators/648')
  end

  it '#stories - A resource list containing the stories which appear in this comic' do
    expect(comic.stories.class).to eq(Array)
    expect(comic.stories.first.class).to eq(Thanos::Item::Story)
    expect(comic.stories.first.name).to eq('Age of X: Avengers (2011) #1')
    expect(comic.stories.first.type).to eq('cover')
    expect(comic.stories.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/stories/90010')
  end

  it '#events - A resource list containing the events in which this comic appears' do
    expect(comic.events.class).to eq(Array)
    expect(comic.events.first.class).to eq(Thanos::Item::Event)
    expect(comic.events.first.name).to eq('Age of X')
    expect(comic.events.first.type).to eq(nil)
    expect(comic.events.first.resource_uri).to eq('http://gateway.marvel.com/v1/public/events/303')
  end
end
