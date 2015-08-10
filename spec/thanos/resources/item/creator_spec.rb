RSpec.describe Thanos::Item::Creator do
  let(:creator_item) { Thanos::Item::Creator.new({ 'resourceURI' => 'http://example.net', 'name' => 'Simone Bianchi', 'role' => 'penciller (cover)' }) }

  it "#name - creator's name" do
    expect(creator_item.name).to eq 'Simone Bianchi'
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(creator_item.resource_uri).to eq('http://example.net')
  end

  it '#role - the role this creator took' do
    expect(creator_item.role).to eq('penciller (cover)')
  end

  describe '#complete' do
    before :each do
      stub_get(creator_item.resource_uri).to_return(
          :body => fixture('creator.json'),
          :headers => {:content_type => 'application/json; charset=utf-8'})
      @complete_creator = creator_item.complete
    end

    it 'fetches the complete view of the resource' do
      expect(@complete_creator.class).to eq(Thanos::Creator)
      expect(@complete_creator.first_name).to eq('Simone')
      expect(@complete_creator.last_name).to eq('Bianchi')
      expect(@complete_creator.full_name).to eq('Simone Bianchi')
    end

    context 'item objects' do
      it 'has list of comic summaries' do
        expect(@complete_creator.comics.class).to eq(Array)
        expect(@complete_creator.comics.first.class).to eq(Thanos::Item::Comic)
        expect(@complete_creator.comics.first.name).to eq('Age of X: Universe (2011) #1')
      end

      it 'has a list of series summaries' do
        expect(@complete_creator.series.class).to eq(Array)
        expect(@complete_creator.series.first.class).to eq(Thanos::Item::Series)
        expect(@complete_creator.series.first.name).to eq('Age of X: Universe (2011)')
      end

      it 'has a list of stories summaries' do
        expect(@complete_creator.stories.class).to eq(Array)
        expect(@complete_creator.stories.first.class).to eq(Thanos::Item::Story)
        expect(@complete_creator.stories.first.name).to eq('1 of 6 - Evolution')
      end

      it 'has a list of events summaries' do
        expect(@complete_creator.events.class).to eq(Array)
        expect(@complete_creator.events.first.class).to eq(Thanos::Item::Event)
        expect(@complete_creator.events.first.name).to eq('Age of X')
      end
    end
  end
end
