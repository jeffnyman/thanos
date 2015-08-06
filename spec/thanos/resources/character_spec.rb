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
      allow(Time).to receive_message_chain(:now, :to_i, :to_s).and_return '1'
      expect(character.resource_uri).to eq 'http://gateway.marvel.com/v1/public/characters/1009220'
    end
  end
end
