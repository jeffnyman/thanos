![Thanos](http://testerstories.com/files/Thanos.Show.Me.jpg)

# Thanos

On 31 January 2014 Marvel Comics [put out a press release](http://marvel.com/news/comics/21871/marvel_announces_the_release_of_the_api_program) announcing an API connecting to Marvel's database of comics, characters, and creators.

Thanos provides a very simple wrapper for the [Marvel API](http://developer.marvel.com/) and attempts to make that API easily queryable by providing qualifier objects that allow a consumer of the API to drill down into specific details.

Thanos is a [Marvel super-villain](https://en.wikipedia.org/wiki/Thanos) and plays a large role in the current [Marvel cinematic universe](http://marvelcinematicuniverse.wikia.com/wiki/Thanos). Thanos has routinely teamed up with Death in order to achieve universe-wide domination. As accomplishments go, that's moderately impressive, to say the least.

## Installation

To get the latest stable release, add this line to your application's Gemfile:

```ruby
gem 'thanos'
```

To get the latest code:

```ruby
gem 'thanos', git: https://github.com/jnyman/thanos
```

After doing one of the above, execute the following command:

    $ bundle

You can, of course, just install the gem directly like this:

    $ gem install thanos

## Usage

### Setting Up the Client

You need API credentials, which is a public and private key pair. You can get yours at the [Marvel Developer Portal](http://developer.marvel.com). These are required to configure and instantiate a Thanos client.

```ruby
require 'thanos'

Thanos.authenticate do |key|
  key.public_api_key = 'your public key'
  key.private_api_key = 'your private key'
end

client = Thanos::Client.new
```

Make sure you put in your own public and private keys that you were assigned. The `client` variable will now hold a `Thanos::Client` instance that you can call endpoint methods on.

## API Access

Thanos is a wrapper around the API resources and is designed to provide a simple interface that allows you to communicate with the API without having to know the structure of the information returned by the API.

Here is a full example of getting information about a character, assuming you have a `client` instance as shown above:

```ruby
hulk = client.characters.find_by_name 'Hulk'

puts hulk.id
puts hulk.name
puts hulk.description
puts hulk.resource_uri
puts hulk.thumbnail.path
puts hulk.thumbnail.extension
puts hulk.thumbnail.full_path

puts hulk.urls.first.url
puts hulk.urls.first.type

hulk.urls.each do |link|
  puts "Url: #{link.url}"
end

hulk.comics.each do |comic|
  puts "Comic: #{comic.name}"
end

hulk.stories.each do |story|
  puts "Story: #{story.name}"
end

hulk.events.each do |event|
  puts "Event: #{event.name}"
end

hulk.series.each do |series|
  puts "Series: #{series.name}"
end
```

This shows you that you can call various attributes of the resource -- in this case a `character` -- and display information about the resource (such as `name` and `description`) as well as information related to the resource, such as a list of `events` or `series` that the character was involved in.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jnyman/thanos](https://github.com/jnyman/thanos). While Thanos wants to create a universe of death, despair and destruction, this project is intended to be a safe, welcoming space for collaboration. As such, contributors are very much welcome but are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

To contribute to Thanos:

1. [Fork the project](http://gun.io/blog/how-to-github-fork-branch-and-pull-request/).
2. Create a feature branch. (`git checkout -b my-new-feature`)
3. Commit your changes. (`git commit -am 'new feature'`)
4. Push the branch. (`git push origin my-new-feature`)
5. Create a new [pull request](https://help.github.com/articles/using-pull-requests).

## Author

* [Jeff Nyman](http://testerstories.com)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
