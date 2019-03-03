Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :episodes
      resources :playlists
      resources :podcasts
      resources :userpodcasts
      resources :users

      post '/podcasts/search/:q', to: 'podcasts#search'
      post '/podcasts/getPodcasts/:id', to: 'podcasts#getPodcasts'
    end
  end
end
