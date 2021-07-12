

Rails.application.routes.draw do

  namespace 'api' do
  	namespace 'v1' do
      match 'tarefas/top10',  :to => 'tarefas#top10', :via => 'get'
  		resources :tarefas
      resources :grupos
     
  	end
  end
  match '*path', :to => 'application#routing_error', via: :all
  devise_for :users
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
