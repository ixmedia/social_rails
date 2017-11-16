# IxSocial

Ease the pain of integrating **Facebook**, **Instagram** and **Twitter** posts in a Rails app. Includes a configurable cache to keep your app from tipping over Facebook and Instagram
api limits.


## Installation

**Gemfile**

``` ruby
gem 'ix_social'
```

**app/assets/javascripts/application.js**

``` ruby
//= require ix_social/ix-social.js
```

**config/routes.rb**

``` ruby
mount IxSocial::Engine => '/social'
```

---------

## Configuration

Run `rails g ix_social:config`

Edit `[Your project]/config/initializers/ix_social.rb`

Each media options can be configured individually using `IxSocial::[Media].configure` method.

```
countdown #15.minutes by default
public: {
    post_count: # 1 by default
    max_characters: # 0 by default
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
<%= ixsocial(:facebook [, options={}]) %>
```

Options must be an Hash of theses available options:

``` ruby
post_count # 1 by default
max_characters # 0 by default
```

Use the following generator command to override views.

``` ruby
rails g ix_social:views
```
