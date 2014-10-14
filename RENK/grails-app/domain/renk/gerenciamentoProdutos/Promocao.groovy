package renk.gerenciamentoProdutos

import java.util.ArrayList
import java.util.List

class Promocao {
    static hasMany = [itens: ItemPromocao]
    List<ItemPromocao> itens = new ArrayList<ItemPromocao>()
    
    String nome
    Date dataInicio = new Date()
    Date dataFim = new Date().plus(7)
    boolean ativa = true

    static constraints = {
        nome(blank: false)
        dataInicio()
        dataFim()
    }
    
    void finish(){
        dataFim = new Date()
        ativa = false
    }
    
    boolean isFinalizada(){
        if (dataFim.getDate() > new Date().getDate()){
            return true
        }
        return false
    }

    boolean addProduto(Produto produto, double desconto){
        if (this.getItemByProduct(produto)){
            return false
        } else if (desconto >= 0 && desconto <= 100){               
        
            ItemPromocao item = new ItemPromocao()
        
            item.produto = produto
            item.desconto = desconto
            item.promocao = this
        
            if (item.hasErrors()){
                return false
            }
            produto.setDesconto(desconto)
        
            this.itens.add(item)
        
            return true
        }
        return false        
    }
    
    ItemPromocao getItemByProduct(Produto produto){
        for (ItemPromocao item : this.itens){
            if (item.produto.id == produto.id){
                return item
            }
        }
        return null
    }
    
    boolean removeProduto(ItemPromocao item){
        if (item){
            if (this.itens.remove(item)){
                item.produto.restaureValor()
                item.delete(flush:true) 
                return true
            }
        }
        
        return false
    }
    
    void restaureAllValuesOfProducts(){
        for (ItemPromocao item : this.itens){
            item.produto.restaureValor()
        }
    }
    
    boolean checkValues(Produto produto){
        if (produto.valorVenda < produto.valorCusto){
            return true
        }
        return false
    }
}
