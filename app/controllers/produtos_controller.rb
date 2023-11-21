class ProdutosController < ApplicationController
    def index
        # limit 5 = são os 5 nomes de produtos mais baratos
        @produtos_por_nome = Produto.order(:nome).limit 5
        @produtos_por_preco = Produto.order(:preco).limit 2
    end

    def new
        @produto = Produto.new 
        @departamentos = Departamento.all
    end

    def busca
        @nome_a_buscar = params[:nome]
        @produtos =  Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end

    def edit
        id = params[:id]
        @produto = Produto.find(id)
        @departamentos = Departamento.all
        render :new 
    end

    def update
        id = params[:id]
        @produto = Produto.find(id)
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        if @produto.update valores
            flash[:notice] = "Produto atualizao com sucesso"
            redirect_to root_url
        else
            @departamentos = Departamento.all
            render :new 
        end
    end

    def create 
        valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
        @produto = Produto.new valores
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso"
            redirect_to root_url
        else
            @departamentos = Departamento.all
            render :new 
            #renderização do novo produto
        end
    end

    def destroy 
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
end
