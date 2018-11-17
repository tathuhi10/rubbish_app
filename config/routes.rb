Rails.application.routes.draw do

  root 'rubbish#home'

  get 'rubbish/home'
  post '/search', to: 'rubbish#search'

end
