# to_results

You work with JSON all the time.  JSON is easy to work with.  That's what makes it great.  JSON.parse returns a nicely formatted hash, that represents, well, the original JSON.  But what if you actually want your end result of parsing JSON to simply be . . . objects?  JSON is JavaScript Object Notation, after all.

## Installation

Add this line to your application's Gemfile:

    gem 'to_results'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_results

## Usage

Parse JSON.

```ruby
  require 'json'
  require 'to_results'

  str = %{
          {"menu": {
             "id": "file",
          "value": "File",
          "popup": {
            "menuitem": [
              {"value": "New", "onclick": "CreateNewDoc()"},
              {"value": "Open", "onclick": "OpenDoc()"},
              {"value": "Close", "onclick": "CloseDoc()"}
              ]
            }
          }}
        }
  json = JSON.parse str
```

Get results.

```ruby
  results = json.to_results
```

Look at the objects.

```ruby
  menu = results.menu
  => #<struct Struct::Menu>
  menu.id
  => "file"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
