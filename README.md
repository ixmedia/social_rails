# IxSocial

Ease the pain of integrating **Facebook** and **Instagram** posts in a Rails app. Includes a configurable cache to keep your app from tipping over Facebook and Instagram
api limits.


## Installation

``` ruby
source 'http://gems.ixmedia.com:9292/'
gem 'ix_social'
```
---------
## Configuration
In `config/initializers/ix_social.rb`

#### Optional
`cooldown` (default 15 minutes)

`post_count` (default 1)

### Facebook

#### Required
`app_id`, `app_secret`, `page_name`

``` ruby
IxSocial::Facebook.configure do |config|
  # App id
  config.app_id = "[YOUR APP ID]"
  # App secret
  config.app_secret = "[YOUR APP SECRET]"
  # Page name
  config.page_name = "[YOUR PAGE NAME]"
end
```

### Instagram

#### Required
`user_id`, `access_token`

``` ruby
IxSocial::Instagram.configure do |config|
  # User id
  config.user_id = "[USER ID]"
  # Access token
  config.access_token = "[INSTAGRAM ACCESS TOKEN]"
end
```
-------
## Utilisation

> Pour utiliser la cache de Rails en developement, ajouter ce fichier `tmp/caching-dev.txt`

Use the view helper:


```ruby
<%= ix_social(:facebook, [options={}]) %>
```

### Override templates

Add a `app/views/[FACEBOOK||INSTAGRAM]/latest.html.erb` to your rails app to override the gem's default templates.

Le tableau `@posts` est disponible dans ces vues.

Ex.:

> @posts.each { |post| p post["message"] }
