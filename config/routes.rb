Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# Un utilisateur peut voir toutes les listes
# GET "lists"
# Un utilisateur peut voir les détails d’une liste donnée et son nom
# GET "lists/42"
# Un utilisateur peut créer une nouvelle liste
# GET "lists/new"
# POST "lists"
