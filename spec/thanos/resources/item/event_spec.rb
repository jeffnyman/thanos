RSpec.describe Thanos::Item::Event do
  let(:event_item) { Thanos::Item::Event.new({ 'id' => '123', 'resourceURI' => 'http://example.net', 'name' => 'Testing' }) }

  it '#id' do
    expect(event_item.id).to eq(123)
  end

  it '#resource_uri' do
    expect(event_item.resource_uri).to eq('http://example.net')
  end

  it '#type should always be nil' do
    expect(event_item.type).to eq(nil)
  end

  it '#name' do
    expect(event_item.name).to eq('Testing')
  end

  describe '#complete' do
    before :each do
      stub_get(event_item.resource_uri).to_return(
          :body => fixture('event.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_event = event_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_event.class).to eq(Thanos::Event)
      expect(@complete_event.title).to eq('Fall of the Mutants')
    end

    context 'item objects' do
      it 'has list of comic summaries' do
        expect(@complete_event.comics.class).to eq(Array)
        expect(@complete_event.comics.first.class).to eq(Thanos::Item::Comic)
        expect(@complete_event.comics.first.name).to eq('Captain America (1968) #339')
      end

      it 'has a list of characters summaries' do
        expect(@complete_event.characters.class).to eq(Array)
        expect(@complete_event.characters.first.class).to eq(Thanos::Item::Character)
        expect(@complete_event.characters.first.name).to eq('Havok')
      end

      it 'has a list of series summaries' do
        expect(@complete_event.series.class).to eq(Array)
        expect(@complete_event.series.first.class).to eq(Thanos::Item::Series)
        expect(@complete_event.series.first.name).to eq('Daredevil (1963 - 1998)')
      end

      it 'has a list of stories summaries' do
        expect(@complete_event.stories.class).to eq(Array)
        expect(@complete_event.stories.first.class).to eq(Thanos::Item::Story)
        expect(@complete_event.stories.first.name).to eq('Fall of the Mutants')
      end
    end
  end
end
