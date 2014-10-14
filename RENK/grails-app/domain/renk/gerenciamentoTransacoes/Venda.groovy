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
    
    String pagamento
    
    static constraints = {
        quantidadeTotal(min: 0)
        valorTotal(min:0d)
        pagamento(nullable: true)
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
        ItemVendaProduto item = new ItemVendaProduto(produto, this, quantidade)
        
        for(ItemVendaProduto itemNaLista: this.itensProduto){
            if(itemNaLista.produto.id == produto.id){
                return false
            }
        }
        
        if(quantidade < 0){
            return false
        }
        
        if(item.hasErrors()){
            return false
        }
        
        this.itensProduto.add(item)
        
        this.quantidadeTotalProdutos += item.quantidade
        this.valorTotalProdutos += item.total
        
        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.total
        
        return true
    }
    
    boolean removeItemProduto(ItemVendaProduto item){
        if(this.itensProduto.remove(item)){
            this.quantidadeTotalProdutos -= item.quantidade
            this.valorTotalProdutos -= item.total
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }
    
    ItemVendaServico getItemByServico(Servico servico){
        for (ItemVendaServico item : this.itensServico){
            if (item.servico.id == servico.id){
                return item
            }
        }
        return null
    }
    
    boolean addItemServico(Servico servico, int quantidade){
        boolean retorno = true
        if (this.getItemByServico(servico)){
            retorno = false
        } else if (quantidade > 0){
            ItemVendaServico item = new ItemVendaServico(servico, this, quantidade)
            if (item.hasErrors()){
                retorno = false
            } else {
                this.itensServico.add(item)
                retorno = true
            }
        } else {
            retorno = false
        }
        return retorno
    }
    
    boolean removeItemServico(ItemVendaServico item){
        if(this.itensServico.remove(item)){
            this.quantidadeTotalServicos -= item.quantidade
            this.valorTotalServicos -= item.total
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }
    
    void updateSaldoOfProducts(){
        for(ItemVendaProduto item : this.itensProduto){
            item.produto.saldo -= item.quantidade
            item.produto.quantidadeVendido += item.quantidade
            item.produto.save(flush: true)
        }
    }
    
    void incrementServicos(){
        for(ItemVendaServico item : this.itensServico){
            item.servico.quantidadeRealizado += item.quantidade
            item.servico.save(flush: true)
        }
    }
    
    boolean finalizarVenda(){
        this.setFinalizada()        
        this.updateSaldoOfProducts()
        this.incrementServicos()
        return true
    }
    
}
