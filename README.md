# UtmTracker

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/utm_tracker`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'utm_tracker'
```

And then execute:

    $ bundle install

## Usage for Rails

1. You need to generate Rails migration and add utm_data into your User model for UTM-tags

$ rails g migration add_utm_data_to_executors utm_data:jsonb

and add not null and default modificators into rails migrations

```ruby
def change
  add_column :users, :utm_data, :jsonb, null: false, default: {}
end
```

and then:

$ rails db:migrate

2. Prepare link into user registration controller

$ https://example.com?utm[source]=google&utm[medium]=cpc&utm[campaign]=testcampaign&utm[content]={adgroupid}&utm[term]={keyword}

3. Generate code for ApplicationController

#

4. Into user registration controller add UtmTracker client after save user and put user object and utm_data:

```ruby
@utm = UtmTracker::Client.new(object: @user, utm: session[:utm])
@utm.call
```

5. PROFIT!!!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexlev1/utm_tracker.

