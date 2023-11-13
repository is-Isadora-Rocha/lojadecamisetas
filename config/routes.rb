Rails.application.routes.draw do

  # post "/produtos" => "produtos#create"
  post "/produtos", to: "produtos#create"
  get "/produtos/new" => "produtos#new"
  get "/produtos/:id/remove" => "produtos#destroy"
  root "produtos#index"

end
