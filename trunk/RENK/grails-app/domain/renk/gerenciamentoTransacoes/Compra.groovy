package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto

class Compra extends Transacao{
    enum Status{
        EM_ABERTO, FINALIZADA, RECEBIDA, CANCELADA
    }
    Status status = Status.EM_ABERTO
    static hasMany = [itens: ItemCompra]
    List<ItemCompra> itens = new ArrayList<ItemCompra>()
    int quantidadeTotal = 0;
    double valorTotal = 0;

    static constraints = {
        quantidadeTotal(min: 0)
        valorTotal(min:0d)
    }
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.FINALIZADA){
            return "Finalizada"
        } else if (status == Status.RECEBIDA){
            return "Recebida"
        } else {
            return "Cancelada"
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
    
    boolean isFinalizada(){
        if (status == Status.FINALIZADA){
            return true
        }
    }
    
    boolean isRecebida(){
        if (status == Status.RECEBIDA){
            return true
        }
    }
    
    void setEmAberto(){
        status = Status.EM_ABERTO
    }
    
    void setCancelada(){
        status = Status.CANCELADA
    }
    
    void setFinalizada(){
        status = Status.FINALIZADA
    }
    
    void setRecebida(){
        status = Status.RECEBIDA
    }
    
    boolean addItemProduto(Produto produto, int quantidade){
        if (ItemCompra.findByCompraAndProduto(this,produto)){
            return false
        }
        
        ItemCompra item = new ItemCompra(produto, this, quantidade)
        
        if(item.hasErrors()){
            return false
        }
        
        this.itens.add(item)
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.total
        
        return true
    }
    
    boolean removeItemProduto(ItemCompra item){
        if(this.itens.remove(item)){
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }
    
}
