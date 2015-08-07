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
end
