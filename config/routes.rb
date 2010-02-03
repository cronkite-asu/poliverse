ActionController::Routing::Routes.draw do |map|
  map.resources :committee_memberships

  map.resources :politicians, :has_many => [ :committee_membershipts, :seats ]

  map.resources :committees, :has_many => :committee_memberships

  map.resources :parties, :has_many => :politicians

  map.resources :seats, :has_many => :politicians

  map.resources :seat_types, :has_many => :seats

  map.resources :counties

  map.resources :states, :has_many => :counties

  map.resources :levels, :has_many => [ :seats, :committees ]

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_sessions

  map.root :controller => 'poliverse'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
