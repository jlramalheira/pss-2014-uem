package renk.gerenciamentoServicos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import renk.gerenciamentoAutenticacao.Funcionario

@Transactional(readOnly = true)
class OrdemServicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrdemServico.list(params), model:[ordemServicoInstanceCount: OrdemServico.count()]
    }

    def show(OrdemServico ordemServicoInstance) {
        respond ordemServicoInstance
    }

    def create() {
        respond new OrdemServico(params)
    }
    
    def newSolution(OrdemServico ordemServicoInstance) {
        redirect(action:"create", controller:"solucao", params: [idOrdem: ordemServicoInstance.id])
    }

    @Transactional
    def save(OrdemServico ordemServicoInstance) {
        if (ordemServicoInstance == null) {
            notFound()
            return
        }

        if (ordemServicoInstance.hasErrors()) {
            respond ordemServicoInstance.errors, view:'create'
            return
        }

        if (params.funcionario.id == '-1'){
            Funcionario funcionario = Funcionario.list().get(0);
            ordemServicoInstance.funcionario = funcionario;
        }
        
        //pog
        ordemServicoInstance.dataPrevisao = ordemServicoInstance.dataEmissao
        ordemServicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ordemServicoInstance.label', default: 'OrdemServico'), ordemServicoInstance.id])
                redirect ordemServicoInstance
            }
            '*' { respond ordemServicoInstance, [status: CREATED] }
        }
    }

    def edit(OrdemServico ordemServicoInstance) {
        respond ordemServicoInstance
    }
    
    def searchSolutions(OrdemServico ordemServicoInstance) {
        respond ordemServicoInstance
    }

    @Transactional
    def update(OrdemServico ordemServicoInstance) {
        if (ordemServicoInstance == null) {
            notFound()
            return
        }

        if (ordemServicoInstance.hasErrors()) {
            respond ordemServicoInstance.errors, view:'edit'
            return
        }

        //pog
        ordemServicoInstance.dataPrevisao = ordemServicoInstance.dataEmissao
        ordemServicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrdemServico.label', default: 'OrdemServico'), ordemServicoInstance.id])
                redirect ordemServicoInstance
            }
            '*'{ respond ordemServicoInstance, [status: OK] }
        }
    }

    @Transactional
    def complete(OrdemServico ordemServicoInstance) {

        if (ordemServicoInstance == null) {
            notFound()
            return
        }
        
        ordemServicoInstance.concluir()
        ordemServicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Ordem Servico concluida', args: [message(code: 'OrdemServico.label', default: 'OrdemServico'), ordemServicoInstance.id])
                redirect ordemServicoInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def cancel(OrdemServico ordemServicoInstance) {

        if (ordemServicoInstance == null) {
            notFound()
            return
        }
        
        ordemServicoInstance.cancelar()
        ordemServicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Ordem Servico cancelada', args: [message(code: 'OrdemServico.label', default: 'OrdemServico'), ordemServicoInstance.id])
                redirect ordemServicoInstance
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordemServicoInstance.label', default: 'OrdemServico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
