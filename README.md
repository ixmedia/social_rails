# IxSocial

Ease the pain of integrating **Facebook** and **Instagram** posts in a Rails app. Includes a configurable cache to keep your app from tipping over Facebook and Instagram
api limits.


## Installation

``` ruby
source 'http://gems.ixmedia.com:9292/'
gem 'ix_social'
```

Dans votre application.js
``` ruby
```

---------

## Configuration

Run `rails g ix_social:config`

Edit `[Your project]/config/initializers/ix_social.rb`

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

- `max_characters`
- `post_count`


