# Caruby2go

caruby2go is a gem that exposes [the car2go api](https://code.google.com/p/car2go/wiki/index_v2_1).

For all operations you need to [get your own consumer key from car2go](https://www.car2go.com/en/austin/car2go-apps/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'caruby2go'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install caruby2go

## Packaging

    $ rake build

build.sh (in this project's root) will build and install the gem locally.

## Local usage
The script requires you to set the CONSUMER_KEY environment variable to your Car2Go consumer key

    $ set CONSUMER_KEY=<your_consumer_key>
    $ bin/caruby2go p kobenhavn
or 

    $ CONSUMER_KEY=<your_consumer_key> bin/caruby2go p kobenhavn


## Contributing

1. Fork it ( https://github.com/[my-github-username]/caruby2go/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
