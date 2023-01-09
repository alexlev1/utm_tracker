# UtmTracker

This gem allow to save UTM tags into your Rails app. UtmTracker allows you to save in the user object with which advertisement he was registered.

## Requirements

- Ruby 2.7 / 3.1
- Rails 6 / 7

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'utm_tracker'
```

And then execute:

`$ bundle install`

## Usage for Rails

1. You need to generate Rails migration and add utm_data into your User model for UTM-tags:

`$ rails g migration add_utm_data_to_users utm_data:jsonb`

and add not null and default modificators into rails migrations:
```ruby
def change
  add_column :users, :utm_data, :jsonb, null: false, default: {}
end
```

and then:

`$ rails db:migrate`

2. Prepare link into user registration controller:

`$ https://example.com?utm_source=google&utm_medium=cpc&utm_campaign=testcampaign&utm_content={adgroupid}&utm_term={keyword}`

Important: gem can woek only with this utm tags!

3. Add into ApplicationController next helper for save utm_tags into current_user session:
```ruby
class ApplicationController < ActionController::Base
  include UtmTracker::Helper
end
```

4. After that, you can use callback into your controllers for get utm data in current user session:
```ruby
before_action :get_utm_data
```

Add this callback where you plan to receive advertising traffic.

5. Into user registration controller or after_sign_in_path_for method, add UtmTracker client current_user object and session, for_example:
```ruby
def after_sign_in_path_for(resource)
  generate_utm_tags
  something_path_for_redirecting # add your own path
end

def generate_utm_tags
  UtmTracker::Client.new(current_user, session[:utm_data]).call
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexlev1/utm_tracker.

