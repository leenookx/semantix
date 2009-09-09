ActionController::Routing::Routes.draw do |map|
  map.resources :twitter_trends

  map.resources :twitter_trend_heads

  map.resources :twitterations

  map.resources :blogs
  map.resources :semanticblogs
  map.resources :calaisservices

  map.resources :feeds, :has_many => :stories
  map.resources :links
  map.resources :stories

  map.root :controller => "home"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
