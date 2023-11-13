class ProdutosController < ApplicationController
    def index
        # limit 5 = são os 5 nomes de produtos mais baratos
        @produtos_por_nome = Produto.order(:nome).limit 5
        @produtos_por_preco = Produto.order(:preco).limit 2
        # limit 2 = são os 2 preços de produtos mais baratos
    end

    def busca
        @nome_a_buscar = params[:nome]
        @produtos=  Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    def create 
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
        produto = Produto.create valores
        redirect_to root_url
    end

    def destroy 
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
end
