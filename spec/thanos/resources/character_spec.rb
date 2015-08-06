RSpec.describe Thanos::Character do
  describe 'Attributes' do
    let(:data) { fixture('character.json').read }
    let(:response) { Thanos::API::Response.new(data) }
    let(:response_holder) { Thanos::ResponseHolder.new(response) }
    let(:character) { Thanos::Factory::Character.new(response_holder.results).build }

    it '#id - The unique ID of the character resource' do
      expect(character.id).to eq 1009220
    end

    it '#name - The name of the character' do
      expect(character.name).to eq 'Captain America'
    end

    it '#description - A short bio or description of the character' do
      description = 'Vowing to serve his country any way he could, young ' +
      "Steve Rogers took the super soldier serum to become America's one-man " +
      'army. Fighting for the red, white and blue for over 60 years, Captain ' +
      'America is the living, breathing symbol of freedom and liberty.'

      expect(character.description).to eq(description)
    end

    it '#resourceURI - The canonical URL identifier for this resource' do
      expect(character.resource_uri).to eq 'http://gateway.marvel.com/v1/public/characters/1009220'
    end

    it '#urls - A set of public web site URLs for the resource' do
      expect(character.urls.class).to eq(Array)
      expect(character.urls.first.type).to eq('detail')
      expect(character.urls.first.url).to eq('http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7')
    end

    it '#thumbnail - The representative image for this character' do
      expect(character.thumbnail.class).to eq(Thanos::Thumbnail)
      expect(character.thumbnail.path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/2/c0/5261a81d0154e')
      expect(character.thumbnail.extension).to eq('jpg')
      expect(character.thumbnail.full_path).to eq('http://i.annihil.us/u/prod/marvel/i/mg/2/c0/5261a81d0154e.jpg')
    end
  end
end
