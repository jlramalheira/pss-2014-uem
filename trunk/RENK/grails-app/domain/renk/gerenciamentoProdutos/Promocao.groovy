package renk.gerenciamentoProdutos

import java.util.ArrayList
import java.util.List

class Promocao {
    static hasMany = [itens: ItemPromocao]
    List<ItemPromocao> itens = new ArrayList<ItemPromocao>()
    
    String nome
    Date dataInicio = new Date()
    Date dataFim = new Date()

    static constraints = {
        nome(blank: false)
        dataInicio()
        dataFim()
    }
    
    void finish(){
        dataFim = new Date()
    }
    
    boolean isFinalizada(){
        if (dataFim.getDate() > new Date().getDate()){
            return true
        }
        return false
    }

    boolean addProduto(Produto produto, double desconto){
        if (ItemPromocao.findByPromocaoAndProduto(this,produto)){
            return false
        }               
        
        ItemPromocao item = new ItemPromocao()
        
        item.produto = produto
        item.desconto = desconto
        item.promocao = this
        
        this.itens.add(item)
        
        return true
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
                return true
            }
        }
        
        return false
    }
}
