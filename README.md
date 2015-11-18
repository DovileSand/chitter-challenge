Chitter Challenge
=================

Chitter is a little Twitter clone that will allow the users to post messages to a public stream. It includes sign in, sign up and log out functionalities, as well as password encryption.
* User can sign up to chitter with their email, password, name and a user name (e.g. name: 'MakersLady', username: 'MissWonderful', email: 'MakersLady@paradise.com', password: 'M3dali0n5')
* The username and email are unique.
* User doesn't have to be logged in to see the peeps.
* Peeps (posts to chitter) have the name of the poster and their user handle.
* User can only can peep if he/she is logged in.


Getting started:
----------------
*Run `git clone https://github.com/DovileSand/chitter-challenge` in your chosen directory.
*Run `bundle` to install dependancies.


Features:
---------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


Usage:
------

* Run `rackup` in the command line.
* Navigate to `http://localhost:9292/`
* HEROKU LINK goes here


Running tests:
--------------

* To run tests type `rspec` in the command line.


Frameworks, utilities and libraries used:
------------------------------
* sinatra
* sinatra-flash
* BCrypt
* DataMapper (including database cleaner) and postgres:
```
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
```
* rakeFile:
```
RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

namespace :db do
  desc "Non destructive upgrade"
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Auto-migrate complete (data was lost)"
    end
end
```


Notes on test coverage:
-----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
```

Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Then run `open coverage/index.html` from the command line to view details
