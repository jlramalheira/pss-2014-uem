package renk.gerenciamentoTransacoes
import renk.gerenciamentoProdutos.Produto

class SolicitacaoCompra {
    enum Status{
        EM_ABERTO, CANCELADA, CONCLUIDA
    }
    
    Date dataSolicitacao = new Date()
    Status status = Status.EM_ABERTO
    static hasMany = [itens: ItemSolicitacao]
    List<ItemSolicitacao> itens = new ArrayList<ItemSolicitacao>()
    

    static constraints = {
        dataSolicitacao(nullable: true)
        status(nullable: true)
    }
    
    boolean addProduto(Produto produto, int quantidade, double valor){
        if (ItemSolicitacao.findBySolicitacaoCompraAndProduto(this,produto)){
            return false
        } 
        ItemSolicitacao item = new ItemSolicitacao()
        item.solicitacaoCompra = this
        item.produto = produto
        item.quantidade = quantidade
        item.valor = valor
        item.total = quantidade*valor
            
        if (item.hasErrors()){
            return false
        }
            
        this.itens.add(item)
            
        return true        
    }
    
    boolean removeProduto(ItemSolicitacao item){
        if (item){
            if (this.itens.remove(item)){
                item.delete(flush:true) 
                return true
            }
        }        
        return false
    }
    
    Compra transformeCompra(){
        Compra compra = new Compra()
        compra.setEmAberto()
        compra.save(flush: true)
        for (ItemSolicitacao item: this.itens){
            compra.addItemProduto(item.produto, item.quantidade, item.valor)
        }
        
        if (compra.hasErrors()){
            return null
        } 
        
        return compra
    }
    
    double getValorTotal(){
        double valorTotal = 0
        for (ItemSolicitacao item: this.itens){
            valorTotal += (item.produto.valorCusto * item.quantidade)
        }
        return valorTotal
    }
    
    int getQuantidadeTotal(){
        int quantidade = 0
        for (ItemSolicitacao item: this.itens){
            quantidade += item.quantidade
        }
        return quantidade
    }
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.CANCELADA){
            return "Cancelada"
        } else {
            return "Concluida"
        }
    }
    
    boolean isEmAberto(){
        if (status == Status.EM_ABERTO){
            return true
        }
    }
    
    boolean isCancelada(){
        if (status == Status.CANCELADA){
            return true
        }
    }
    
    boolean isConcluida(){
        if (status == Status.CONCLUIDA){
            return true
        }
    }
    
    void setConcluida(){
        status = Status.CONCLUIDA
    }
    
    void setCancelada(){
        status = Status.CANCELADA
    }
}
