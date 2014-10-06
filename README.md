# Rushover::Cli

`rushover-cli` is a command line interface to the `rushover` gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rushover-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rushover-cli

## Usage

rushover message [-t title]

## Caveats

`rushover-cli` requires a `:user` key and a `:rush` key to be saved to `~/.rushrc`.

```yaml
# Example

---
:user: youruserkey
:rush: anyapptoken
```

The application you use doesn't need to be named 'rush'. It just needs to be any app token. If you want to change the title that gets passed to Pushover, just use the `-t` option.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rushover-cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
