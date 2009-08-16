ActionController::Routing::Routes.draw do |map|
  map.resources :feeds

  map.resources :links

  map.root :controller => "home"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
