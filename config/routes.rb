IxSocial::Engine.routes.draw do

  get '/facebook',  to: 'facebook#latest'
  get '/instagram', to: 'instagram#latest'
  get '/twitter',   to: 'twitter#latest'

end
