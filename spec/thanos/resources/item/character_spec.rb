RSpec.describe Thanos::Item::Character do
  let(:character_item) { Thanos::Item::Character.new('id' => '123', 'resourceURI' => 'http://example.net', 'name' => 'Hulk') }

  describe '#complete' do
    before :each do
      stub_get(character_item.resource_uri).to_return(
        :body => fixture('character.json'),
        :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_character = character_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_character.class).to eq(Thanos::Character)
      expect(@complete_character.name).to eq('Captain America')
    end

    it '#id' do
      expect(character_item.id).to eq(123)
    end

    it '#resource_uri' do
      expect(character_item.resource_uri).to eq('http://example.net')
    end

    it '#type should always be nil' do
      expect(character_item.type).to eq(nil)
    end

    it '#name' do
      expect(character_item.name).to eq('Hulk')
    end

    context 'item objects' do
      it 'has list of comic summaries' do
        expect(@complete_character.comics.class).to eq(Array)
        expect(@complete_character.comics.first.class).to eq(Thanos::Item::Comic)
        expect(@complete_character.comics.first.name).to eq('Age of Apocalypse (2011) #2 (Avengers Art Appreciation Variant)')
      end

      it 'has a list of stories summaries' do
        expect(@complete_character.stories.class).to eq(Array)
        expect(@complete_character.stories.first.class).to eq(Thanos::Item::Story)
        expect(@complete_character.stories.first.name).to eq('Cover #892')
      end

      it 'has a list of events summaries' do
        expect(@complete_character.events.class).to eq(Array)
        expect(@complete_character.events.first.class).to eq(Thanos::Item::Event)
        expect(@complete_character.events.first.name).to eq('Acts of Vengeance!')
      end

      it 'has a list of series summaries' do
        expect(@complete_character.series.class).to eq(Array)
        expect(@complete_character.series.first.class).to eq(Thanos::Item::Series)
        expect(@complete_character.series.first.name).to eq('Age of Apocalypse (2011 - Present)')
      end
    end
  end
end
