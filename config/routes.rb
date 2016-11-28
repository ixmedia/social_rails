IxSocial::Engine.routes.draw do

  get '/facebook',  to: 'facebook#latest'

end
