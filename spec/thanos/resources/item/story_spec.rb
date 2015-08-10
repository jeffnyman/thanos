RSpec.describe Thanos::Item::Story do
  let(:story_item) { Thanos::Item::Story.new({ 'id' => '123', 'resourceURI' => 'http://example.net', 'name' => "Hulk" }) }

  describe '#complete' do
    before :each do
      stub_get(story_item.resource_uri).to_return(
          :body => fixture('story.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_story = story_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_story.class).to eq(Thanos::Story)
      expect(@complete_story.title).to eq('Cover #892')
    end

    it '#id' do
      expect(story_item.id).to eq(123)
    end

    it '#resource_uri' do
      expect(story_item.resource_uri).to eq('http://example.net')
    end

    it '#type should always be nil' do
      expect(story_item.type).to eq(nil)
    end

    it '#name' do
      expect(story_item.name).to eq('Hulk')
    end

    context 'item objects' do
      it 'has list of comic summaries' do
        expect(@complete_story.comics.class).to eq(Array)
        expect(@complete_story.comics.first.class).to eq(Thanos::Item::Comic)
        expect(@complete_story.comics.first.name).to eq('Thor (1998) #81')
      end

      it 'has a list of characters summaries' do
        expect(@complete_story.characters.class).to eq(Array)
        expect(@complete_story.characters.first.class).to eq(Thanos::Item::Character)
        expect(@complete_story.characters.first.name).to eq('Avengers')
      end

      it 'has a list of series summaries' do
        expect(@complete_story.series.class).to eq(Array)
        expect(@complete_story.series.first.class).to eq(Thanos::Item::Series)
        expect(@complete_story.series.first.name).to eq('Thor (1998 - 2004)')
      end

      it 'has a list of events summaries' do
        expect(@complete_story.events.class).to eq(Array)
        expect(@complete_story.events.first.class).to eq(Thanos::Item::Event)
        expect(@complete_story.events.first.name).to eq('Avengers Disassembled')
      end
    end
  end
end
