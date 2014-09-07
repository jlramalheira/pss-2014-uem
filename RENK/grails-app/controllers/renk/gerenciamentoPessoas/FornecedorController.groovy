package renk.gerenciamentoPessoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FornecedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
        def c = Fornecedor.createCriteria()
        def results = c.list {
            if(params.nome){
                like("nome", "%"+params.nome+"%")
            }
            if(params.pessoaJuridica.cnpj){
                pessoaJuridica{
                    like("cnpj", "%"+params.pessoaJuridica.cnpj+"%")
                }                
            }
            if(params.pessoaJuridica.inscricaoEstadual){
                pessoaJuridica{
                    like("inscricaoEstadual", "%"+params.inscricaoEstadual.cnpj+"%")
                }                
            }
            if(params.email){
                like("email", "%"+params.email+"%")   
            }
            if(params.telefone){
                like("telefone", "%"+params.telefone+"%")    
            }
            if(params.celular){
                like("celular", "%"+params.celular+"%")    
            }
        }
        
        if(results.size() == 0){
            request.message_info = message(code: 'default.search.notfound.message', default: 'Nada encontrado')
        }
        
        respond results, model:[fornecedorInstanceCount: Fornecedor.count()]
    }

    def show(Fornecedor fornecedorInstance) {
        respond fornecedorInstance
    }

    def create() {
        params.tipoPessoa = new PessoaJuridica()
        params.enderecos = new ArrayList<Endereco>()
        respond new Fornecedor(params)
    }

    @Transactional
    def save(Fornecedor fornecedorInstance) {
        if (fornecedorInstance == null) {
            notFound()
            return
        }
        
        if (!fornecedorInstance.validate()) {
            fornecedorInstance.errors.each {
                println it
            }
        }
        def pessoaJuridica = fornecedorInstance.pessoaJuridica;
        pessoaJuridica.save(flush:true)
        
        
        if (fornecedorInstance.hasErrors()) {
            respond fornecedorInstance.errors, view:'create'
            return
        }
        
        fornecedorInstance.save flush:true
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fornecedorInstance.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*' { respond fornecedorInstance, [status: CREATED] }
        }
    }

    def edit(Fornecedor fornecedorInstance) {
        respond fornecedorInstance
    }

    @Transactional
    def update(Fornecedor fornecedorInstance) {
        if (fornecedorInstance == null) {
            notFound()
            return
        }

        if (fornecedorInstance.hasErrors()) {
            respond fornecedorInstance.errors, view:'edit'
            return
        }

        fornecedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*'{ respond fornecedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Fornecedor fornecedorInstance) {

        if (fornecedorInstance == null) {
            notFound()
            return
        }

        fornecedorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def inactivate(Fornecedor fornecedorInstance) {

        if (fornecedorInstance == null) {
            notFound()
            return
        }
        
        fornecedorInstance.setAtivo(false)
        fornecedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Fornecedor inativado', args: [message(code: 'fornecedor.label', default: 'fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def activate(Fornecedor fornecedorInstance) {

        if (fornecedorInstance == null) {
            notFound()
            return
        }
        
        fornecedorInstance.setAtivo(true)
        fornecedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Fornecedor ativado', args: [message(code: 'Fornecedor.label', default: 'Fornecedor'), fornecedorInstance.id])
                redirect fornecedorInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fornecedorInstance.label', default: 'Fornecedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
