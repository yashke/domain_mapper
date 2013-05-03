# DomainMapper

DomainMapper let you map data to your domain objects and represent your domain objects as data.

## Installation

Add this line to your application's Gemfile:

    gem 'domain_mapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install domain_mapper

## Usage

How to define map:

```ruby
class DomainClass
end

map = DomainMapper::Map.new(DomainClass) do
  attribute :instance_variable_name, "key value"
end
hash = {
  "key value" => "value"
}
object = map.build_object(hash)
object.is_a?(DomainClass) #=> true
object.instance_variable_get(:@instance_variable_name) #=> "value"
```
