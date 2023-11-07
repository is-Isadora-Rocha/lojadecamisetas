class ProdutosController < ApplicationController
    def index
        @todos = Produto.order :nome
    end
end
