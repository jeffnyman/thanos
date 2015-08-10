RSpec.describe Thanos::Item::Comic do
  let(:comic_item) { Thanos::Item::Comic.new({ 'id' => '123', 'resourceURI' => 'http://example.net', 'name' => 'Testing' }) }

  it '#id' do
    expect(comic_item.id).to eq(123)
  end

  it '#resource_uri' do
    expect(comic_item.resource_uri).to eq('http://example.net')
  end

  it '#type should always be nil' do
    expect(comic_item.type).to eq(nil)
  end

  it '#name' do
    expect(comic_item.name).to eq('Testing')
  end

  describe '#complete' do
    before :each do
      stub_get(comic_item.resource_uri).to_return(
          :body => fixture('comic.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_comic = comic_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_comic.class).to eq(Thanos::Comic)
      expect(@complete_comic.title).to eq('Age of X: Universe (2011) #1')
    end

    context 'item objects' do
      it 'has a list of characters summaries' do
        expect(@complete_comic.characters.class).to eq(Array)
        expect(@complete_comic.characters.first.class).to eq(Thanos::Item::Character)
        expect(@complete_comic.characters.first.name).to eq('Captain America')
      end

      it 'has a list of series summaries' do
        expect(@complete_comic.series.class).to eq(Array)
        expect(@complete_comic.series.first.class).to eq(Thanos::Item::Series)
        expect(@complete_comic.series.first.name).to eq('Age of X: Universe (2011)')
      end

      it 'has a list of stories summaries' do
        expect(@complete_comic.stories.class).to eq(Array)
        expect(@complete_comic.stories.first.class).to eq(Thanos::Item::Story)
        expect(@complete_comic.stories.first.name).to eq('Age of X: Avengers (2011) #1')
      end

      it 'has a list of events summaries' do
        expect(@complete_comic.events.class).to eq(Array)
        expect(@complete_comic.events.first.class).to eq(Thanos::Item::Event)
        expect(@complete_comic.events.first.name).to eq('Age of X')
      end
    end
  end
end
