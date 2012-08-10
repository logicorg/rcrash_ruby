= RcrashRuby

= Getting started

rCrash Ruby works with Rails 3.x. You can add it to your Gemfile with:

```ruby
gem 'rcrash_ruby', path: 'rcrash_ruby/'
```

And run the bundle command to install it.

Then you need to run the generator:

```console
rails g rcrash_ruby:install
```

This will create rcrash_ruby.rb file in config/initializers/ directory. To start using rCrash you have to set up RcrashRuby:

1. Change API_KEY in config/initilizers/rcrash_ruby.rb
   API_KEY can be obtained on http://rcrash.com

2. Change ENABLED to true in config/initilizers/rcrash_ruby.rb

= License

This project rocks and uses MIT-LICENSE. Copyright 2012 RubyLogic http://rubylogic.pl