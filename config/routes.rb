ActionController::Routing::Routes.draw do |map|

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_sessions

  map.root :controller => 'poliverse'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
