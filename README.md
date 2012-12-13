RcrashRuby
====================

Getting started
---------------------

rCrash Ruby works with Rails 3.x. You can add it to your Gemfile with:

```ruby
gem 'rcrash_ruby', :git => 'git://github.com/logicorg/rcrash_ruby.git'
```

And run the bundle command to install it.

Then you need to run the generator:

```console
rails g rcrash_ruby:install
```

This will create rcrash.yml file in config/ directory. To start using rCrash you have to set up RcrashRuby:

1. Change API_KEY in config/rcrash.yml API_KEY can be obtained on http://rcrash.com

2. Change ENABLED to true in config/rcrash.yml

3. Change ENVIRONMENT if needed

4. Add config/rcrash.yml file to .gitignore if git is used

License
---------------------

This project uses MIT-LICENSE.

Copyright 2012 RubyLogic http://rubylogic.pl
