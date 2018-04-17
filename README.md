# SocialRails

Ease the pain of integrating **Facebook**, **Instagram** and **Twitter** posts in a Rails app. Includes a configurable cache to keep your app from tipping over Facebook and Instagram
api limits.


## Installation

**Gemfile**

``` ruby
gem 'social_rails'
```

**app/assets/javascripts/application.js**

``` ruby
//= require social_rails/social-rails.js
```

**config/routes.rb**

``` ruby
mount SocialRails::Engine => '/social'
```

---------

## Configuration

Run `rails g social_rails:config`

Edit `[Your project]/config/initializers/social_rails.rb`

Each media options can be configured individually using `SocialRails::[Media].configure` method.

```
countdown #15.minutes by default
public: {
    post_count: # 1 by default
    max_characters: # 0 by default
    refresh: # false by default
    refresh_time: # 15.minutes.in_milliseconds by default
}
```


-------

## Utilisation

> Pour utiliser la cache de Rails en developement:
>
> - cd to your project installation
> - run `touch tmp/caching-dev.txt`

Use the view helper:

```ruby
<%= socialrails(:facebook [, options={}]) %>
```

Options must be an Hash of theses available options:

``` ruby
post_count # 1 by default
max_characters # 0 by default
refresh # false by default
refresh_time # 900000 (15 minutes) in milliseconds
```

Use the following generator command to override views.

``` ruby
rails g social_rails:views
```
