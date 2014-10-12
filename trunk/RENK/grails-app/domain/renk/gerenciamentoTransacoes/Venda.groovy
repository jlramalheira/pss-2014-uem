package renk.gerenciamentoTransacoes

import renk.gerenciamentoProdutos.Produto
import renk.gerenciamentoServicos.Servico

class Venda extends Transacao{
    enum Status{
        EM_ABERTO, CANCELADA, FINALIZADA
    }
    
    Status status = Status.EM_ABERTO
    static hasMany = [itensProduto: ItemVendaProduto, itensServico: ItemVendaServico]
    List<ItemVendaProduto> itensProduto = new ArrayList<ItemVendaProduto>()
    int quantidadeTotalProdutos = 0
    double valorTotalProdutos = 0
   
    List<ItemVendaServico> itensServico = new ArrayList<ItemVendaServico>()
    int quantidadeTotalServicos = 0
    double valorTotalServicos = 0
    
    int quantidadeTotal = 0
    double valorTotal = 0
    
    static constraints = {
        quantidadeTotal(min: 0)
        valorTotal(min:0d)
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
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.FINALIZADA){
            return "Finalizada"
        } else {
            return "Cancelada"
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
    
    boolean addItemProduto(Produto produto, int quantidade){
        if (ItemVendaProduto.findByVendaAndProduto(this,produto)){
            return false
        }
        
        ItemVendaProduto item = new ItemVendaProduto(produto, this, quantidade)
        
        if(item.hasErrors()){
            return false
        }
        
        this.itens.add(item)
        
        this.quantidadeTotalProdutos += item.quantidade
        this.valorTotalProdutos += item.total
        
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.total
        
        return true
    }
    
    boolean removeItemProduto(ItemVendaProduto item){
        if(this.itens.remove(item)){
            this.quantidadeTotalProdutos -= item.quantidade
            this.valorTotalProdutos -= item.total
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }
    
    boolean addItemServico(Servico servico, int quantidade){
        if (ItemVendaServico.findByVendaAndServico(this,servico)){
            return false
        }
        
        ItemVendaServico item = new ItemVendaServico(servico, this, quantidade)
        
        if(item.hasErrors()){
            return false
        }
        
        this.itens.add(item)
        this.quantidadeTotalServicos += item.quantidade
        this.valorTotalServicos += item.total
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.total
        
        return true
    }
    
    boolean removeItemServico(ItemVendaServico item){
        if(this.itens.remove(item)){
            this.quantidadeTotalServicos -= item.quantidade
            this.valorTotalServicos -= item.total
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }
}
