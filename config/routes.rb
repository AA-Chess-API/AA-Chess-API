Rails.application.routes.draw do
  resources :games, only: [:index, :create, :show, :update]
  patch "/join", to: "games#join", as: "join"
  ptach "/quit", to: "games#quit", as: "quit"
end
