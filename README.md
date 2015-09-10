# Cuba::NotFound

Not found helper for Cuba.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cuba-errors'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install cuba-errors
```

## Usage

See an example:

```ruby
require 'cuba'
require 'cuba/errors'
require 'cuba/render'

Cuba.plugin Cuba::Errors
Cuba.plugin Cuba::Render

# This setting specifies which view is going to be used for rendering a 404
# page. If not set, nothing will be rendered.
Cuba.settings[:errors][:not_found] = 'not_found'

Cuba.define do
  on default do
    # sets status = 404
    # sets Content-Type = text/html; charset=utf-8
    # renders views/not_found.erb
    not_found!
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/cuba-errors/blob/master/LICENSE).