SocialRails::Engine.routes.draw do

  get '/facebook',  to: 'social#latest', template: 'facebook'
  get '/instagram', to: 'social#latest', template: 'instagram'
  get '/twitter',   to: 'social#latest', template: 'twitter'
end
