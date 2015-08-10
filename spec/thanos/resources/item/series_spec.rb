RSpec.describe Thanos::Item::Series do
  let(:series_item) { Thanos::Item::Series.new({ 'resourceURI' => 'http://example.net', 'name' => 'Testing' }) }

  it '#resource_uri' do
    expect(series_item.resource_uri).to eq('http://example.net')
  end

  it '#name' do
    expect(series_item.name).to eq('Testing')
  end

  describe '#complete' do
    before :each do
      stub_get(series_item.resource_uri).to_return(
          :body => fixture('series.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_series = series_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_series.class).to eq(Thanos::Series)
      expect(@complete_series.title).to eq('Daredevil (1963 - 1998)')
    end

    context 'item objects' do
      it 'has list of comic summaries' do
        expect(@complete_series.comics.class).to eq(Array)
        expect(@complete_series.comics.first.class).to eq(Thanos::Item::Comic)
        expect(@complete_series.comics.first.name).to eq('Daredevil (1963)')
      end

      it 'has a list of characters summaries' do
        expect(@complete_series.characters.class).to eq(Array)
        expect(@complete_series.characters.first.class).to eq(Thanos::Item::Character)
        expect(@complete_series.characters.first.name).to eq('Beast')
      end

      it 'has a list of stories summaries' do
        expect(@complete_series.stories.class).to eq(Array)
        expect(@complete_series.stories.first.class).to eq(Thanos::Item::Story)
        expect(@complete_series.stories.first.name).to eq('Life Be Not Proud!')
      end

      it 'has a list of events summaries' do
        expect(@complete_series.events.class).to eq(Array)
        expect(@complete_series.events.first.class).to eq(Thanos::Item::Event)
        expect(@complete_series.events.first.name).to eq('Acts of Vengeance!')
      end
    end
  end
end
