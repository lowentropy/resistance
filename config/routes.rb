Resistance::Application.routes.draw do
  resources :teams, :rounds, :players
  resources :games do
    get :resume, :on => :collection
  end
  root :to => "games#resume"
end
