Rails.application.routes.draw do
=begin

  post "/produtos", to: "produtos#create"
  get "/produtos/new" => "produtos#new"
  delete "/produtos/:id" => "produtos#destroy", as: :produto

=end

# resources: gera todos os http
  resources :produtos, only: [:new, :create, :destroy]
  root "produtos#index"

end
