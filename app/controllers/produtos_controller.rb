class ProdutosController < ApplicationController
    def index
        # limit 5 = são os 5 nomes de produtos mais baratos
        @produtos_por_nome = Produto.order(:nome).limit 5
        @produtos_por_preco = Produto.order(:preco).limit 2
        # limit 2 = são os 2 preços de produtos mais baratos
    end

    def create 
        valores = params.require(:produto).permit!
        produto = Produto.create valores
    end
end
