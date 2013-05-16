# UniversalIdentifiable

Make your model uniq and identifiable through a readable name.
Adds uuids to ActiveRecord models along with validators.

[![Build Status](https://secure.travis-ci.org/neopoly/universal_identifiable.png?branch=master)](http://travis-ci.org/neopoly/universal_identifiable) [![Gem Version](https://badge.fury.io/rb/universal_identifiable.png)](http://badge.fury.io/rb/universal_identifiable) [![Code Climate](https://codeclimate.com/github/neopoly/universal_identifiable.png)](https://codeclimate.com/github/neopoly/universal_identifiable)

## Installation

Add this line to your application's Gemfile:

    gem 'universal_identifiable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install universal_identifiable

## Usage

Create a migration for your existing model with the built in generator.

Example:
<pre>
rails g uuid Airport
</pre>

In your model:

```ruby
class Airport < ActiveRecord::Base
  include UniversalIdentifiable
end
```

Set a uuid like you would with any other attribute.

```ruby
airport = Airport.new(uuid: "dortmund")
```
Uuids are automatically prefixed with the modelname and namespaced with a dot. E.G: "airport.dortmund"

You have access to an unnamespaced uuid by passing the appropriate option:

```ruby
airport.uuid(namespaced: false)
=> "dortmund"
airport.uuid
=> "airport.dortmund"
```

Validators:

Two validators are automatically added to your model:

```ruby
validates :uuid, :presence => true, :uniqueness => true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
