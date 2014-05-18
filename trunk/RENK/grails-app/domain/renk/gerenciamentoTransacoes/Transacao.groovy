package renk.gerenciamentoTransacoes

import renk.gerenciamentoPessoas.Pessoa

abstract class Transacao {
    static belongsTo = [pessoa:Pessoa]
    Date dataTransacao = new Date()
    int quantidadeTotal = 0
    double valorTotal = 0
    
    static constraints = {
        pessoa(nullable:true)
        dataTransacao()
        quantidadeTotal(editable: false)
        valorTotal(editable: false)
    }
    
    private void solicitarCompra(){
        
    }
    
    void cancelar(){
        
    }    
}
