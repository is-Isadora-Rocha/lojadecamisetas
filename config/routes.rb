Rails.application.routes.draw do
  resources :departamentos
=begin
 * requisições unitárias: 
  sem o uso do resources => 

  post "/produtos", to: "produtos#create"
  get "/produtos/new" => "produtos#new"
  delete "/produtos/:id" => "produtos#destroy", as: :produto

=end

# resources: gera todas as requisições
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  root "produtos#index"

end
