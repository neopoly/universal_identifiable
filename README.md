# UniversalIdentifiable

Make your model uniq and identifiable through a readable name.
Adds uuids to ActiveRecord models along with validators.

## Installation

Add this line to your application's Gemfile:

    gem 'universal_identifiable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install universal_identifiable

## Usage

Create a migration for your existing model which adds an attribute called 'uuid'. The type must be String.

Example:
<pre>
add_column :airports, :uuid, :string
add_index :airports, :uuid, :unique => true
</pre>

In your model:


```ruby
class Airport < ActiveRecord::Base
  include UniversalIdentifiable
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
